import 'package:flutter/material.dart';

AppBar appBarValorant() {
  return AppBar(
    toolbarHeight: 120,
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: const Image(
      height: 56,
      image: AssetImage(
        'assets/valorant_icon.png',
      ),
    ),
  );
}
