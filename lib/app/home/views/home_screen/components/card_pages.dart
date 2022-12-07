import 'package:flutter/material.dart';

class CardPages extends StatelessWidget {
  final String label;
  final String redirect;
  const CardPages({Key? key, required this.label, required this.redirect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, redirect),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.amber),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}
