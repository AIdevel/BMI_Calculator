import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomHeight,
        color: kBottomboxColor,
        margin: EdgeInsets.only(top: 10.0),
        child: Text(
          buttonTitle,
          style: kCalculate,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
