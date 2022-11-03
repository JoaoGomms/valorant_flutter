import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/controllers/home_controller.dart';
import 'package:valorant_flutter/app/views/home/components/agent_card.dart';

import '../../models/agent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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

  Widget buildGridViews(List<Agent> agents) {
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
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(
                height: 56,
                image: AssetImage(
                  'assets/valorant_icon.png',
                ),
              ),
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
                    buildGridViews(controller.agents),
                    buildGridViews(controller.controllerAgents),
                    buildGridViews(controller.duelistAgents),
                    buildGridViews(controller.sentinelAgents),
                    buildGridViews(controller.initiatorAgents),
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
