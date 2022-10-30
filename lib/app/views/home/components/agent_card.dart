import 'package:flutter/material.dart';

import '../../../models/agent.dart';

class AgentCard extends StatefulWidget {
  final Agent agent;
  const AgentCard({Key? key, required this.agent}) : super(key: key);

  @override
  State<AgentCard> createState() => _AgentCardState();
}

List<Color> transformIntoColor(List<dynamic> stringColors) {
  List<Color> colors = [];

  for (String stringColor in stringColors) {
    colors.add(Color(int.parse('FF${stringColor.substring(0, 6)}', radix: 16))
        .withOpacity(1));
  }

  return colors;
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
            height: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    transform: GradientRotation(6),
                    colors: transformIntoColor(widget.agent.gradientColors)),
                borderRadius: BorderRadius.circular(16)),
          ),
          Positioned(
            bottom: 32.0,
            child: SizedBox(
                height: 280,
                child: Image.network(widget.agent.imageUrl,
                    fit: BoxFit.fitHeight)),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(widget.agent.name),
          ),
        ],
      ),
    );
  }
}
