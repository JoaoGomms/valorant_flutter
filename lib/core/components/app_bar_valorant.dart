import 'package:flutter/material.dart';

AppBar appBarValorant() {
  return AppBar(
    toolbarHeight: 48,
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
