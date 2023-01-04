import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 19;
  Gender selectedGender = Gender.male;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor == inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor == inactiveCardColor;
  //     }
  //   }
  // }

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male ? Constants.activeCardColor : Constants.inactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female ? Constants.activeCardColor : Constants.inactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: Constants.labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: Constants.numTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: Constants.labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x1FEB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                      ),
                      child: Slider(
                        value: height.roundToDouble(),
                        onChanged: ((value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                        min: 120,
                        max: 240,
                      ),
                    )
                  ],
                ),
                color: Constants.activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: Constants.labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: Constants.numTextStyle,
                              ),
                              const Text(
                                'kg',
                                style: Constants.labelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                // icon: const Padding(
                                //   padding: EdgeInsets.only(bottom: 15),
                                //   child: Icon(Icons.minimize),
                                // ),
                                icon: const Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      color: Constants.activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: Constants.labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: Constants.numTextStyle,
                              ),
                              const Text(
                                'yr',
                                style: Constants.labelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                // icon: const Padding(
                                //   padding: EdgeInsets.only(bottom: 15),
                                //   child: Icon(Icons.minimize),
                                // ),
                                icon: const Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      color: Constants.activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain cb = CalculatorBrain(
                  height: height,
                  weight: weight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: cb.calculateBMI(),
                      interpretation: cb.getInterpretation(),
                      result: cb.getResult(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE',
            ),
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Constants.bottomContainerColor,
        height: Constants.bottomContainerHeight,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: icon,
    );
  }
}
