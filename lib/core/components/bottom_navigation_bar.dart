import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant_flutter/app/agent/views/agents_list/agent_list_screen.dart';
import 'package:valorant_flutter/app/map/views/map_list_screen.dart';
import 'package:valorant_flutter/app/tiers/views/tier_list_screen.dart';
import 'package:valorant_flutter/design/valorant_app_icons.dart';

class BottomNavigationBarValorant extends StatefulWidget {
  const BottomNavigationBarValorant({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarValorant> createState() => _BottomNavigationBarValorantState();
}

class _BottomNavigationBarValorantState extends State<BottomNavigationBarValorant> {
  var index = 0;

  List<Widget?> bottomNavigationBarScreens = const [
    AgentListScreen(),
    MapListScreen(),
    TierListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavigationBarItems = const [
      BottomNavigationBarItem(icon: Icon(ValorantAppIcons.agent), label: 'Agentes'),
      BottomNavigationBarItem(icon: Icon(ValorantAppIcons.map), label: 'Mapas'),
      BottomNavigationBarItem(icon: Icon(ValorantAppIcons.tier), label: 'Elos'),
    ];

    return Scaffold(
      body: bottomNavigationBarScreens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        selectedIconTheme: const IconThemeData(color: Colors.red),
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

//TODO: Fix bottom navigation bar icons
  Widget _buildIcon(String asset) => SvgPicture.asset(
        asset,
        height: 48,
        width: 48,
        alignment: Alignment.center,
        fit: BoxFit.fill,
        allowDrawingOutsideViewBox: true,
      );
}
