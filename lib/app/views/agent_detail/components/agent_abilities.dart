import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/models/agent.dart';

class AgentAbilities extends StatelessWidget {
  final Agent agent;
  const AgentAbilities({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Habilidades',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: ((context, index) => Text('')))
        ],
      ),
    );
  }
}
