import 'screens/Results_Page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0a001d),
        scaffoldBackgroundColor: Color(0xff130026),
      ),
      initialRoute: '/',
      routes: {
       '/' : (context)=> InputPage(),
        '/first': (context)=> Result_Page()
      },
    );
  }
}


