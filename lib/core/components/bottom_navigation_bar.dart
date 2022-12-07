import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/agent/views/agents_list/agents_list.dart';

class BottomNavigationBarValorant extends StatefulWidget {
  const BottomNavigationBarValorant({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarValorant> createState() => _BottomNavigationBarValorantState();
}

class _BottomNavigationBarValorantState extends State<BottomNavigationBarValorant> {
  var index = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Agentes'),
    BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark_add), label: 'Elos'),
  ];

  List<Widget?> bottomNavigationBarScreens = const [
    AgentsList(),
    Center(child: Text('Mapas')),
    Center(child: Text('Elos')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationBarScreens[index],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: index,
        onTap: (newIndex) => onTabTapped(newIndex),
      ),
    );
  }

  void onTabTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
