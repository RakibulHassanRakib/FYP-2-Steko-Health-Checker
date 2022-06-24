// ignore: file_names
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int weight;
  final int height;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than average. Make an effort to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'Your body weight is normal. Good job!';
    } else {
      return 'Your body weight is lower than average. You are welcome to eat a little more.';
    }
  }
}
