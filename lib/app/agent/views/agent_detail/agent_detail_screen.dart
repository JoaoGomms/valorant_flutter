// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/agent.dart';
import 'components/main.dart';

class AgentDetailScreen extends StatefulWidget {
  const AgentDetailScreen({Key? key}) : super(key: key);

  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)?.settings.arguments as Agent;

    return Scaffold(
      body: Column(children: [
        Expanded(flex: 1, child: AgentBanner(agent: agent)),
        Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  AgentInfo(agent: agent),
                  SizedBox(
                    height: 16,
                  ),
                  AgentAbilities(agent: agent),
                ],
              ),
            ))
      ]),
    );
  }
}
