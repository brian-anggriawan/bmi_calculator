import '../utils/constants.dart';
import 'dart:math';

class Bmi {
  int _inputHeight = 150;
  int _inputWeight = 50;
  int _inputAge = 17;
  double _bmi = 0;
  String _result = '';
  String _interpretation = '';
  Gender selectedGender = Gender.male;

  Map getForm() {
    return {
      'gender': selectedGender,
      'weight': _inputWeight,
      'height': _inputHeight,
      'age': _inputAge
    };
  }

  void setGender(Gender gender) {
    selectedGender = gender;
  }

  void setWeight(int weight) {
    _inputWeight = weight;
  }

  void setHeight(int height) {
    _inputHeight = height;
  }

  void setAge(int age) {
    _inputAge = age;
  }

  void calculateBmi() {
    _bmi = _inputWeight / pow(_inputHeight / 100, 2);
    if (_bmi < 18.5) {
      _result = 'Underweight';
      _interpretation =
          'You have a lower than normal body weight, You can eat a bit more.';
    }
    if (_bmi >= 18.5 && _bmi <= 24.9) {
      _result = 'Healthy Weight';
      _interpretation = 'You have a normal body weight, Good job!';
    }
    if (_bmi >= 25.0 && _bmi <= 29.9) {
      _result = 'Overweight';
      _interpretation =
          'You have a higher than normal body weight, Try to excercise more.';
    }
    if (_bmi >= 30.0) {
      _result = 'Obese';
      _interpretation =
          'You have a obese body, Try to excercise more and eat well.';
    }
  }

  Map getResult() {
    return {
      'bmi': _bmi.toStringAsFixed(1),
      'result': _result,
      'interpretation': _interpretation,
    };
  }
}
