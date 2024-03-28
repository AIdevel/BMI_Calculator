import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0.0;

  // Calculating the BMI
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // show Category of Body Weight
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

// Suggestion
  String getSuggestion() {
    if (_bmi >= 25) {
      return 'You have a Higher than Normal body Weight, Try to do exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a Normal body weight. Good job!';
    } else {
      return 'You gave a Lower than Normal body weight, You can eat a bit more.';
    }
  }
}
