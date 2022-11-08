import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/views/agent_detail/agent_detail_screen.dart';
import 'package:valorant_flutter/app/views/agents_list/agents_list.dart';
import 'package:valorant_flutter/app/views/home_screen/home_screen.dart';

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
        '/home': (context) => const HomeScreen(),
        '/agentsList': (context) => const AgentsList(),
        '/agentDetail': (context) => const AgentDetailScreen(),
      },
    );
  }
}
