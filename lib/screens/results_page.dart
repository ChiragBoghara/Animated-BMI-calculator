import 'package:animated_bmi_calculator/components/bottom_button.dart';
import 'package:animated_bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bmi_calculator/constants.dart';

class ResultPage extends StatefulWidget {
  final String result;
  final String bmi;
  final String suggestion;

  ResultPage(
      {@required this.result, @required this.bmi, @required this.suggestion});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  AnimationController slideController;
  Animation slideAnimation;
  @override
  void initState() {
    slideController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    slideController.forward();
    slideAnimation = Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: slideController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyel,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SlideTransition(
              position: slideAnimation,
              child: ReusableCard(
                color: kActiveCardColor,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        widget.result,
                        style: kResultTextStyle,
                      ),
                      Text(
                        widget.bmi,
                        style: kBMITextStyle,
                      ),
                      Text(
                        widget.suggestion,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
