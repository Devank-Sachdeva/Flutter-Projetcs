import 'package:flutter/material.dart';
import 'Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF011627),
        scaffoldBackgroundColor: Color(0xFF011627),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xffeceff1),
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
