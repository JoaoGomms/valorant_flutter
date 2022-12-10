import 'package:flutter/material.dart';

Widget topTitleValorant({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 48),
    child: Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    ),
  );
}
