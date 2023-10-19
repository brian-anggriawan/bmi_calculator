import 'package:flutter/material.dart';
import '../components/button_primary.dart';
import '../components/custom_container.dart';
import '../utils/constants.dart';

class Result extends StatelessWidget {
  Result({
    required this.bmi,
    required this.result,
    required this.interpretation,
  });

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: CustomContainer(
                color: kActiveCardColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result,
                      style: resultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBmiTextResultStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            ButtonPrimary(
              onTap: () {
                Navigator.pop(context);
              },
              buttonChild: Center(
                child: Text(
                  'RECALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
