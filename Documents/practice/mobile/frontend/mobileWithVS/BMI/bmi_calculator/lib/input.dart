// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_container.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int height = 180;
  int age = 10;
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F52BA),
        title: Center(child: Text("BMI")),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kColourSelected
                            : kColourUnselected,
                        cardChild: IconContainer(
                            icon: FontAwesomeIcons.mars, text: "MALE"),
                        onPress: () {
                          setState(
                            () {
                              selectedGender = Gender.male;
                            },
                          );
                        })),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kColourSelected
                        : kColourUnselected,
                    cardChild: IconContainer(
                        icon: FontAwesomeIcons.venus, text: "FEMALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kColourUnselected,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text("cm"),
                            ],
                          ),
                          Slider(
                              activeColor: Color.fromARGB(255, 255, 255, 255),
                              inactiveColor: Color.fromARGB(255, 113, 107, 107),
                              min: 120,
                              max: 220,
                              value: height.toDouble(),
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.round();
                                });
                              })
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kColourUnselected,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text("kg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      kColourUnselected)),
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight -= 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(kColourUnselected),
                              ),
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kColourUnselected,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      kColourUnselected)),
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age -= 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      kColourUnselected)),
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: "Calculate",
            onPress: () {
              BMICalculator bmi = BMICalculator(height: height, weight: weight);
              String bmiVal = bmi.calculate();
              String resultText = bmi.getResultText();
              String interp = bmi.getInterpretaion();
              print(bmiVal);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultText: resultText,
                    resultVal: bmiVal,
                    interp: interp,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
