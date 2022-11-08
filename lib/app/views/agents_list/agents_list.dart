import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/controllers/home_controller.dart';

import '../../models/agent.dart';
import 'components/agent_card.dart';

class AgentsList extends StatefulWidget {
  const AgentsList({Key? key}) : super(key: key);

  @override
  State<AgentsList> createState() => _AgentsListState();
}

class _AgentsListState extends State<AgentsList> with TickerProviderStateMixin {
  HomeController controller = GetIt.I.get<HomeController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        initialIndex: 0, length: tabWidgets().length, vsync: this);
    controller.fetchAgents();
  }

  List<Widget> tabWidgets() {
    return const [
      Text('Todos'),
      Text('Controladores'),
      Text('Duelistas'),
      Text('Sentinelas'),
      Text('Iniciadores'),
    ];
  }

  Widget _buildGridViews(List<Agent> agents) {
    return GridView.count(
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        children: agents
            .map((agent) => InkWell(
                onTap: () => Navigator.pushNamed(context, '/agentDetail',
                    arguments: agent),
                child: AgentCard(agent: agent)))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Image(
            height: 56,
            image: AssetImage(
              'assets/valorant_icon.png',
            ),
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () => Navigator.canPop(context)
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/home'),
              icon: const Icon(Icons.arrow_back))),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Escolha seu Agente',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 48,
              ),
              TabBar(
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  controller: tabController,
                  labelColor: Colors.red,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  unselectedLabelColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                    insets: EdgeInsets.symmetric(horizontal: 32),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.red,
                    ),
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 2),
                  tabs: tabWidgets()),
              Expanded(
                child: Observer(builder: (context) {
                  return TabBarView(controller: tabController, children: [
                    _buildGridViews(controller.agents),
                    _buildGridViews(controller.controllerAgents),
                    _buildGridViews(controller.duelistAgents),
                    _buildGridViews(controller.sentinelAgents),
                    _buildGridViews(controller.initiatorAgents),
                  ]);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
