import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/models/agent.dart';

class AgentBanner extends StatelessWidget {
  final Agent agent;
  const AgentBanner({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 36),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(agent.imageUrl),
            alignment: Alignment.topCenter,
            fit: BoxFit.none,
            scale: 3,
            opacity: 0.4,
          ),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10.0)],
          gradient: LinearGradient(
              colors: agent.gradientColors.getRange(0, 2).toList())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Expanded(
            flex: 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        agent.name,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(agent.role.name,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
