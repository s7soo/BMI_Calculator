import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class BottomButton extends StatelessWidget{

  BottomButton({this.onTap,this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
              buttonTitle,
              style: kButtonTextStyle
          ),
        ),

        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomColor,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}