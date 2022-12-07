import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/agent.dart';

class AgentCard extends StatefulWidget {
  final Agent agent;
  const AgentCard({Key? key, required this.agent}) : super(key: key);

  @override
  State<AgentCard> createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 260,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    transform: const GradientRotation(6), colors: widget.agent.gradientColors.getRange(0, 2).toList()),
                borderRadius: BorderRadius.circular(16)),
          ),
          Positioned(
              bottom: 40.0,
              child: CachedNetworkImage(
                imageUrl: widget.agent.imageUrl,
                height: 300,
                filterQuality: FilterQuality.high,
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.agent.name,
              style: const TextStyle(color: Colors.white, fontSize: 20, shadows: [
                Shadow(
                  offset: Offset(4, 4),
                  blurRadius: 25.0,
                  color: Colors.white,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
