import 'package:flutter/material.dart';

class BMICalculator {
  BMICalculator({this.height, this.weight});
  final height;
  final weight;
  // final resultText;
  double bmi = 0;

  String calculate() {
    bmi = ((weight) / (height * height / 10000));
    return bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi > 24) {
      return "Overweight";
    }
    return "Normal";
  }

  String getInterpretaion() {
    if (bmi < 18.5) {
      return "You are under the normal weight you should consider eating more.";
    } else if (bmi > 24) {
      return "You are over the normal weight. Perhaps start exercising?";
    }
    return "All good. Keep being healthy.";
  }
}
