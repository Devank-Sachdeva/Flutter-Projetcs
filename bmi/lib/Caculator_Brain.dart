import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    print(_bmi);
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getQuote() {
    if (_bmi >= 25) {
      return 'You have more than normal body weight, try to exercise more !';
    } else if (_bmi > 18) {
      return 'You have normal body weight, Good job !';
    } else {
      return 'You have a lower than normal body weight, try to eat more !';
    }
  }
}
