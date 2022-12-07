import 'package:flutter/material.dart';
import '../core/components/bottom_navigation_bar.dart';
import 'agent/views/agent_detail/agent_detail_screen.dart';
import 'agent/views/agents_list/agents_list.dart';

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const BottomNavigationBarValorant(),
        '/agentsList': (context) => const AgentsList(),
        '/agentDetail': (context) => const AgentDetailScreen(),
      },
    );
  }
}
