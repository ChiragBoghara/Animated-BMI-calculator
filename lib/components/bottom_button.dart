import 'package:flutter/material.dart';
import 'package:animated_bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onTap;

  BottomButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            text,
            style: kLastContainerTextStyle,
          ),
        ),
        width: double.infinity,
      ),
    );
  }
}
