import 'package:flutter/material.dart';

class ExpandedContainer extends StatelessWidget {
  ExpandedContainer({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: onPress
          ,child: Container(
            child: cardChild,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
    );
  }
}