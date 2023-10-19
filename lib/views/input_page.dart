import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_container.dart';
import '../components/button_primary.dart';
import '../components/gender_card.dart';
import '../utils/constants.dart';
import '../components/round_button.dart';
import '../utils/bmi.dart';
import 'result.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPage();
}

Bmi bmiUtils = Bmi();

class _InputPage extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainer(
                    onPress: () {
                      setState(() {
                        bmiUtils.setGender(Gender.male);
                      });
                    },
                    color: bmiUtils.getForm()['gender'] == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    containerChild: GenderCard(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    onPress: () {
                      setState(() {
                        bmiUtils.setGender(Gender.female);
                      });
                    },
                    color: bmiUtils.getForm()['gender'] == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    containerChild: GenderCard(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomContainer(
              color: kActiveCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        bmiUtils.getForm()['height'].toString(),
                        style: kValueTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                    ),
                    child: Slider(
                      value: bmiUtils.getForm()['height'].toDouble(),
                      max: 300,
                      onChanged: (double value) {
                        setState(() {
                          bmiUtils.setHeight(value.toInt());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainer(
                    color: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          bmiUtils.getForm()['weight'].toString(),
                          style: kValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              action: () {
                                setState(() {
                                  bmiUtils.setWeight(
                                      bmiUtils.getForm()['weight'] > 0
                                          ? (bmiUtils.getForm()['weight'] - 1)
                                          : 0);
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              action: () {
                                setState(() {
                                  bmiUtils.setWeight(
                                      bmiUtils.getForm()['weight'] + 1);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    color: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          bmiUtils.getForm()['age'].toString(),
                          style: kValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              action: () {
                                setState(() {
                                  bmiUtils.setAge(bmiUtils.getForm()['age'] > 0
                                      ? (bmiUtils.getForm()['age'] - 1)
                                      : 0);
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              action: () {
                                setState(() {
                                  bmiUtils
                                      .setAge(bmiUtils.getForm()['age'] + 1);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ButtonPrimary(
            onTap: () {
              bmiUtils.calculateBmi();
              Map result = bmiUtils.getResult();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: result['bmi'],
                    result: result['result'],
                    interpretation: result['interpretation'],
                  ),
                ),
              );
            },
            buttonChild: Center(
              child: Text(
                'CALCULATE',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
