import 'package:flutter/material.dart';
import 'package:valorant_flutter/core/components/bottom_navigation_bar.dart';
import 'components/card_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarValorant(),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 56,
                image: AssetImage(
                  'assets/valorant_icon.png',
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              const CardPages(
                label: 'Agentes',
                redirect: '/agentsList',
              ),
            ],
          )
        ]),
      ),
    );
  }
}
