// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/models/agent.dart';
import 'package:valorant_flutter/app/views/agent_detail/components/agent_abilities.dart';
import 'package:valorant_flutter/app/views/agent_detail/components/agent_banner.dart';
import 'package:valorant_flutter/app/views/agent_detail/components/agent_info.dart';

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
        SizedBox(
          height: 16,
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                AgentInfo(agent: agent),
                SizedBox(
                  height: 8,
                ),
                AgentAbilities(agent: agent),
              ],
            ))
      ]),
    );
  }
}
