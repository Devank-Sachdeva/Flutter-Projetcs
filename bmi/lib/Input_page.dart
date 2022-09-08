import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomCard.dart';
import 'IconBox.dart';
import 'Constants.dart';
import 'result_page.dart';
import 'Caculator_Brain.dart';

enum GenderState { male, female }

enum Operator { plus, minus }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderState? gender;
  Operator? operator;
  int height = 170;
  int weight = 60;
  int age = 18;

  void weightChanger(Operator operator) {
    if (weight > 1) {
      (operator == Operator.plus) ? weight++ : weight--;
    } else {
      if (operator == Operator.plus) weight++;
    }
  }

  void ageChanger(Operator operator) {
    if (age > 1) {
      (operator == Operator.plus) ? age++ : age--;
    } else {
      if (operator == Operator.plus) age++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF011627),
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      Colour: (gender == GenderState.male)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPressFunction: () {
                        setState(() {
                          gender = GenderState.male;
                        });
                      },
                      cardChild: IconBox(
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      Colour: (gender == GenderState.female)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPressFunction: () {
                        setState(() {
                          gender = GenderState.female;
                        });
                      },
                      cardChild: IconBox(
                        text: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                Colour: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBoldLabelTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          thumbColor: kPink,
                          overlayColor: kPink.withOpacity(0.41),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      Colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundIcon(
                                icon: FontAwesomeIcons.minus,
                                operation: () {
                                  setState(() {
                                    weightChanger(Operator.minus);
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              CustomRoundIcon(
                                icon: FontAwesomeIcons.plus,
                                operation: () {
                                  setState(() {
                                    weightChanger(Operator.plus);
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      Colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBoldLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundIcon(
                                icon: FontAwesomeIcons.minus,
                                operation: () {
                                  setState(() {
                                    ageChanger(Operator.minus);
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              CustomRoundIcon(
                                icon: FontAwesomeIcons.plus,
                                operation: () {
                                  setState(() {
                                    ageChanger(Operator.plus);
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomCard(
              Colour: kPink,
              onPressFunction: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      resultNumber: calc.getBMI(),
                      result: calc.getResult(),
                      quote: calc.getQuote(),
                    ),
                  ),
                );
              },
              cardChild: SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoundIcon extends StatelessWidget {
  const CustomRoundIcon({required this.icon, required this.operation});
  final IconData icon;
  final VoidCallback? operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: operation,
      child: Icon(icon),
    );
  }
}
