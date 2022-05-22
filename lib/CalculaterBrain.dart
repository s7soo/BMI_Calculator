import 'dart:math';


class CalculationBrain{

  CalculationBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String bmiCalculate(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25) {
      return 'OverWeight';
    }  else if (_bmi > 18.1) {
      return 'Normal';
    }  else {
      return 'UnderWeight';
    }
  }

  String getFeedBack(){
    if (_bmi >= 25) {
      return 'You are very very fat go do some diet';
    }  else if (_bmi > 18.1) {
      return 'Your body is so sexy i will give you my number';
    }  else {
      return 'you are flat i hate flat';
    }
  }
}