import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/agent.dart';

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
            height: 16,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: agent.abilities.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                var actualAbility = agent.abilities[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: agent.gradientColors.first.withOpacity(0.5), borderRadius: BorderRadius.circular(4)),
                      child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4), color: Colors.black.withOpacity(0.2)),
                            child: CachedNetworkImage(
                              imageUrl: actualAbility.displayIcon,
                              width: 32,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                actualAbility.displayName,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                actualAbility.description,
                                overflow: TextOverflow.visible,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ));
              }))
        ],
      ),
    );
  }
}
