import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant_flutter/app/agent/views/agents_list/agent_list_screen.dart';
import 'package:valorant_flutter/app/map/views/map_list_screen.dart';
import 'package:valorant_flutter/app/tiers/views/tier_list_screen.dart';

class BottomNavigationBarValorant extends StatefulWidget {
  const BottomNavigationBarValorant({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarValorant> createState() =>
      _BottomNavigationBarValorantState();
}

class _BottomNavigationBarValorantState
    extends State<BottomNavigationBarValorant> {
  var index = 0;

  List<Widget?> bottomNavigationBarScreens = const [
    AgentListScreen(),
    MapListScreen(),
    TierListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavigationBarItems = [
      BottomNavigationBarItem(
          icon: _buildIcon('assets/agent.svg'), label: 'Agentes'),
      BottomNavigationBarItem(
          icon: _buildIcon('assets/map.svg'), label: 'Mapas'),
      BottomNavigationBarItem(
          icon: _buildIcon('assets/tier.svg'), label: 'Elos'),
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
