import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class IconContent extends StatelessWidget{
  @override
  IconContent({@required this.icon,@required this.text});
  final IconData icon;
  final String text;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
            size: 80,
            color: Colors.white,
        ),
        SizedBox(height: 15),
        Text('$text',style: kLabelTextStyle
        ),
      ],
    );
  }

}