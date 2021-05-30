import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onTap;

  RoundIconButton({@required this.iconData, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shape: CircleBorder(),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Color(0xFF4C4F5E),
          radius: 28.0,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
