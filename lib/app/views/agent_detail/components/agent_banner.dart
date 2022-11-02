import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/extensions/string_to_color.dart';
import 'package:valorant_flutter/app/models/agent.dart';

class AgentBanner extends StatelessWidget {
  final Agent agent;
  const AgentBanner({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 36),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10.0)],
          gradient: LinearGradient(
              colors: agent.gradientColors
                  .getRange(1, 3)
                  .map((e) => (e as String).toColor())
                  .toList())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          Expanded(
            flex: 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(agent.name),
                      Text(agent.role.name),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
