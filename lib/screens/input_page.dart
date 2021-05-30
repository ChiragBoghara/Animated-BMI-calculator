import 'package:animated_bmi_calculator/calculator_brain.dart';
import 'package:animated_bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_bmi_calculator/components/reusable_card.dart';
import 'package:animated_bmi_calculator/components/gender_card.dart';
import 'package:animated_bmi_calculator/constants.dart';
import 'package:animated_bmi_calculator/components/bottom_button.dart';
import 'package:animated_bmi_calculator/components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with TickerProviderStateMixin {
  Gender selectedGender;
  int sliderValue = 120;
  Color selectedColor = kInactiveCardColor;
  int height = 120;
  int weight = 50;
  int age = 15;
  AnimationController slideControllerLtoR;
  Animation slideAnimationLtoR;
  AnimationController slideControllerRtoL;
  Animation slideAnimationRtoL;

  @override
  void initState() {
    slideControllerLtoR = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    slideControllerLtoR.forward();
    slideAnimationLtoR = Tween<Offset>(begin: Offset(-2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: slideControllerLtoR, curve: Curves.easeInOut));

    slideControllerRtoL =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    slideControllerRtoL.forward();
    slideAnimationRtoL = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: slideControllerRtoL, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  void dispose() {
    slideControllerLtoR.dispose();
    slideControllerRtoL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SlideTransition(
                    position: slideAnimationLtoR,
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: GenderCard(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        text: 'MALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SlideTransition(
                    position: slideAnimationRtoL,
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: GenderCard(
                        icon: Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        text: 'FEMALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SlideTransition(
              position: slideAnimationRtoL,
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sliderValue.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xff8d8e98),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          )),
                      child: Slider(
                        min: 120,
                        max: 220,
                        value: sliderValue.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            sliderValue = value.toInt();
                            height = sliderValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SlideTransition(
                    position: slideAnimationLtoR,
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onTap: () {
                                  if (weight > 1) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SlideTransition(
                    position: slideAnimationRtoL,
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onTap: () {
                                  if (age >= 1) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              CalculateBrain calculate =
                  CalculateBrain(height: height, weight: weight);
              calculate.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calculate.calculateBMI(),
                    result: calculate.getBMI(),
                    suggestion: calculate.getSuggestion(),
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
