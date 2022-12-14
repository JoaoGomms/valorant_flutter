import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/agent/views/agent_detail/agent_detail_screen.dart';

import '../core/components/bottom_navigation_bar.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/agentDetail': (context) => const AgentDetailScreen()},
      home: const BottomNavigationBarValorant(),
    );
  }
}
