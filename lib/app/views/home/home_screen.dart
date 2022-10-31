import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/controllers/home_controller.dart';
import 'package:valorant_flutter/app/views/home/components/agent_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/valorant_icon.png',
                  ),
                ),
                const Text(
                  'Escolha seu Agente',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Observer(builder: (context) {
                  return GridView.count(
                      childAspectRatio: 0.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: controller.agents
                          .map((element) => AgentCard(agent: element))
                          .toList());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
