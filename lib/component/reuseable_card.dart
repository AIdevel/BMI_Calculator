import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({required this.color, required this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
