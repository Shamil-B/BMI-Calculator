import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.resultText,
      required this.resultVal,
      required this.interp});

  final String resultText;
  final String resultVal;
  final String interp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
                decoration: BoxDecoration(
                  color: kColourUnselected,
                ),
                padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 30),
                  width: double.infinity,
                  color: kColourUnselected,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resultText,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 20),
                          child: Text(
                            resultVal,
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(40),
                          child: Text(
                            interp,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w300),
                          ),
                        )
                      ]),
                ),
              ),
              BottomButton(
                text: "Re-Calculate",
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
