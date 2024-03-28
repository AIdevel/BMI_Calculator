import 'package:bmi/constant.dart';
import 'package:bmi/component/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi/calculator_brain.dart';
import '../component/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.suggestion});

  final String bmiResult;
  final String resultText;
  final String suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
                    //margin: EdgeInsets.only(left: 20.0),
                    // alignment: Alignment.center,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Your Result',
                      style: kResultStyle,
                    ))),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                  color: kInActive,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: resultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        suggestion,
                        style: kBodyTextStyle,
                      ),
                    ],
                  )),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CAlCULATE')
          ],
        ),
      ),
    );
  }
}
