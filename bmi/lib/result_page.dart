import 'package:bmi/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomCard.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.result, required this.resultNumber, required this.quote});
  final String result;
  final String resultNumber;
  final String quote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF011627),
        title: Center(
          child: Text('Results '),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Your Result ',
                  style: kRHeadingTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomCard(
                Colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      result,
                      style: kResultTextStyle,
                    ),
                    Text(
                      resultNumber,
                      style: kResultNumber,
                    ),
                    Text(
                      quote,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            CustomCard(
              Colour: kPink,
              onPressFunction: () {
                Navigator.pop(context);
              },
              cardChild: SizedBox(
                height: 80.0,
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
