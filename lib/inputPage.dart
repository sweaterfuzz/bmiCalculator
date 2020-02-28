import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mfCardContent.dart';
import 'reusableCard.dart';
import 'resultsPage.dart';
import 'bottom_button.dart';
import 'roundButton.dart';
import 'constants.dart';
import 'bmi_brain.dart';


enum Genders {female, male}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Genders selectedGender;
  int height = 180;
  int weight = 80;
  int age = 35;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Genders.male? kActiveCardColor : kInactiveCardColor,
                      cardChild: MFcardContent(
                        cardText: 'MALE', 
                        cardIcon: FontAwesomeIcons.mars
                        ),
                      onTap: () {setState(() {
                        selectedGender = Genders.male;
                      });},
                      ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Genders.female? kActiveCardColor : kInactiveCardColor,
                    cardChild: MFcardContent(
                      cardText: 'FEMALE', 
                      cardIcon: FontAwesomeIcons.venus
                      ),
                    onTap: () {setState(() {
                      selectedGender = Genders.female;
                    });},
                    ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kCardTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kCardTextStyle,)
                    ],
                  ),
                  SliderTheme( 
                    // NOTE: customize the style of a widget selectively with *Theme.of; 
                    // ctrl click on a widget to see its full definition complete with defaults.
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kBottomBarColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.floor();
                        });
                      },),
                  )
                ],
              )
                ),
              ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text('WEIGHT', style: kCardTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              setWeight: () {
                                setState(() {
                                  weight--;
                                });
                              },),
                            SizedBox(width: 8.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              setWeight: () {
                                setState(() {
                                  weight++;
                                });
                              },)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text('AGE', style: kCardTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              setWeight: () {
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(width: 8.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              setWeight: () {
                                setState(() {
                                  age++;
                                });
                              },)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE', 
            onTap: (){
              BMIbrain newBMI = BMIbrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: newBMI.calculateBMI(), 
                    result: newBMI.getResult(), 
                    description: newBMI.getDescription()))
              );}
          )
        ],
      ),
    );
  }
}


