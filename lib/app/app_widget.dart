import 'package:flutter/material.dart';
import 'package:valorant_flutter/core/components/bottom_navigation_bar.dart';

import 'agent/views/agent_detail/agent_detail_screen.dart';
import 'agent/views/agents_list/agents_list.dart';
import 'home/views/home_screen/home_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarValorant(),
    );
  }
}
