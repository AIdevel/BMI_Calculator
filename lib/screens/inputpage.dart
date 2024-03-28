import 'package:bmi/screens/result_page.dart';
import 'package:bmi/component/round_button.dart';
import 'package:flutter/material.dart';
import '../component/bottom_button.dart';
import '../component/icon_content.dart';
import '../component/reuseable_card.dart';
import '../constant.dart';
import 'package:bmi/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female, a }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.a;
  int height = 180;
  int weight = 30;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReuseableCard(
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInActive,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, name: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReuseableCard(
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInActive,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, name: 'FEMALE'),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: ReuseableCard(
              color: kActiveColor,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  color: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressButton: () {
                              setState(() {
                                weight > 0
                                    ? weight--
                                    : print("Weight less than Zero");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressButton: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                          //
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  color: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressButton: () {
                                setState(() {
                                  age > 0 ? age-- : print('Age Less than Zero');
                                });
                              }),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressButton: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          suggestion: calc.getSuggestion(),
                        )),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
