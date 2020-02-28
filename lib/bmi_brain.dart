import 'dart:math';

class BMIbrain {

  BMIbrain(this.height, this.weight);
  
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Healthy weight';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You may want to try new ways to manage your activity, stress and eating habits that decrease your weight';
    } else if (_bmi > 18.5) {
      return 'You\'re right on track!';
    } else {
      return 'You may want to try new ways to manage your activity, stress and eating habits that increase your weight';
    }
  }
}