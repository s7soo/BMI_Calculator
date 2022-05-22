import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/IconContent.dart';
import '../components/ExpandedContainer.dart';
import '../Constants.dart';
import 'package:bmi_calculator/screens/Results_Page.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/CalculaterBrain.dart';

enum Gender{
  male, female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override

  String weightLabel = 'WEIGHT';
  String ageLabel = 'AGE';
  Gender selectedGender;
  int height = 180;
  int weight = 20;
  int age = 6;

  // old way

  // Color maleColor = inActiveColor ;
  // Color femaleColor = inActiveColor;

  // void updateColor(Gender selectedGender){
  //   if (selectedGender == Gender.male) {
  //     if (maleColor == inActiveColor) {
  //       maleColor = ActiveColor;
  //       femaleColor = inActiveColor;
  //     }else{
  //       maleColor = inActiveColor;
  //
  //     }
  //   }else if (selectedGender == Gender.female) {
  //     if (femaleColor == inActiveColor) {
  //       femaleColor = ActiveColor;
  //       maleColor = inActiveColor;
  //     }  else {
  //       femaleColor = inActiveColor;
  //     }
  //
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveColor,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            children:<Widget> [
              ExpandedContainer(
                onPress: (){ setState(() {
                  selectedGender = Gender.male;
                }) ; },
                colour: selectedGender == Gender.male ? kActiveColor : kInActiveColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, text: 'MALE')
              ),
              ExpandedContainer(
                onPress: (){ setState(() {
                  selectedGender = Gender.female;
                });},
                colour: selectedGender == Gender.female ? kActiveColor : kInActiveColor,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE')

              ),
            ],
          ),
          ExpandedContainer(colour: kActiveColor,
            cardChild:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle,),
                    Text('cm', style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colors.white,
                    activeTrackColor: Color(0xFF8D8E98),
                    thumbColor: kBottomColor,
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 300.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
            children: [
              ExpandedContainer(
                colour: kActiveColor,
                cardChild:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(weightLabel,style: kLabelTextStyle),
                    Text(weight.toString()
                        ,style: kNumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RounIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                weight--;
                              });
                            },
                        ),
                        SizedBox(width: 10),
                        RounIconButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                          setState(() {
                            weight++;
                          });
                        },),
                      ],
                    )
                  ],
                ),
              ),
              ExpandedContainer(colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ageLabel,style: kLabelTextStyle),
                    Text(age.toString()
                        ,style: kNumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RounIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        RounIconButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              age++;
                            });
                          },),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          ),
           BottomButton(onTap: (){

             CalculationBrain brain = CalculationBrain(weight: weight,height: height);

             Navigator.push(context, MaterialPageRoute(
                 builder: (context) {
                   return Result_Page(bmiResult: brain.bmiCalculate(),typeResult: brain.getResult(),feedbackResult: brain.getFeedBack(),);
                 }
             ));
             // Navigator.pushNamed(context, '/first');
           },
             buttonTitle: 'CALCULATE',)
        ],
      )
    );
  }
}


class RounIconButton extends StatelessWidget{
  @override
  RounIconButton({@required this.icon,@required this.onPress});
  final IconData icon;
  final Function onPress;

  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
      child: Icon(icon,color: Colors.white,),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}



