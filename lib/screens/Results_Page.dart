import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/ExpandedContainer.dart';
import 'package:bmi_calculator/components/BottomButton.dart';

class Result_Page extends StatelessWidget{

  Result_Page({@required this.bmiResult, @required this.feedbackResult,@required this.typeResult});

  final String bmiResult;
  final String typeResult;
  final String feedbackResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveColor,
        title: Text('BMI Calculator',)
      ),
      body: BodyPage(type: typeResult,bmi: bmiResult,advice: feedbackResult)
    );
  }
}


class BodyPage extends StatelessWidget{

  final String type;
  final String bmi;
  final String advice;

  BodyPage({this.type, this.bmi, this.advice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            child: Center(child: Text('YOUR RESULT',style: kTitleTextStyle,)),
          height: 150,
        ),
        Expanded(
          flex: 5,
          child: ExpandedContainer(
              colour: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(type,style: kResultTextStyle),
                Text(bmi.toString(),style: kBmiTextStyle),
                Text(advice,textAlign: TextAlign.center, style: kBodyTextStyle,)
              ],
            ),
          ),
        ),
        BottomButton(onTap: (){
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (context) {
          //       return Result_Page();
          //     }
          // )
          Navigator.pop(context);
        },buttonTitle: 'RE-CALCULATE',)
      ],
    );
  }
}