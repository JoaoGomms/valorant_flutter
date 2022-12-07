import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/agent/views/agent_detail/agent_detail_screen.dart';
import 'package:valorant_flutter/app/agent/views/agents_list/agents_list.dart';
import 'package:valorant_flutter/app/home/views/home_screen/home_screen.dart';

class BottomNavigationBarValorant extends StatefulWidget {
  const BottomNavigationBarValorant({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarValorant> createState() => _BottomNavigationBarValorantState();
}

class _BottomNavigationBarValorantState extends State<BottomNavigationBarValorant> {

  var index = 0;
  
  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'a'),
    BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'b'),
    BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'c'),
  ];

  List<Widget?> bottomNavigationBarScreens = [
    const AgentsList(),
    const HomeScreen(),
    const AgentDetailScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationBarScreens[index],
      bottomNavigationBar: BottomNavigationBar(items: bottomNavigationBarItems, currentIndex: index, onTap: (newIndex) => onTabTapped(newIndex), ),
    );
  }

  void onTabTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
