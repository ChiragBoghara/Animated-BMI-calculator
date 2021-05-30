import 'package:flutter/material.dart';
import 'package:animated_bmi_calculator/constants.dart';

class GenderCard extends StatelessWidget {
  final Icon icon;
  final String text;

  GenderCard({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
