import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/agent_list_controller.dart';
import '../../models/agent_model.dart';
import 'components/agent_card.dart';

class AgentListScreen extends StatefulWidget {
  const AgentListScreen({Key? key}) : super(key: key);

  @override
  State<AgentListScreen> createState() => _AgentListScreenState();
}

class _AgentListScreenState extends State<AgentListScreen> with TickerProviderStateMixin {
  AgentListController controller = GetIt.I.get<AgentListController>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: tabWidgets().length, vsync: this);
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

  Widget _buildGridViews(List<AgentModel> agents) {
    return GridView.count(
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        children: agents
            .map((agent) => InkWell(
                onTap: () => Navigator.pushNamed(context, '/agentDetail', arguments: agent),
                child: AgentCard(agent: agent)))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BottomNavigationBarValorant(),
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
      ),
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
                  labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
