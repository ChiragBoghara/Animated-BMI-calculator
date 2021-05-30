import 'dart:async';

import 'package:animated_bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Duration duration = Duration(seconds: 3);
    Timer(duration, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => InputPage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveCardColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        size: 70.0,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "BMI CALCULATOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      backgroundColor: kActiveCardColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Check Your BMI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
