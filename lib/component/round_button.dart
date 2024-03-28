import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, required this.onPressButton});
  final IconData icon;
  final VoidCallback onPressButton;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressButton,
    );
  }
}
