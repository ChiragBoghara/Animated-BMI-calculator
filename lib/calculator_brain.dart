import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculateBrain({@required this.height, @required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMI() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestion() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight. Try to exercise more. ';
    } else if (_bmi >= 18.5) {
      return 'You have normal body Weight. Good job! ';
    } else {
      return 'You have a lower than normal body weight. You can eat bit more.';
    }
  }
}
