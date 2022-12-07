import 'package:flutter/material.dart';

import '../../../models/agent_model.dart';

class AgentInfo extends StatelessWidget {
  final AgentModel agent;
  const AgentInfo({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Biografia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            agent.description,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
