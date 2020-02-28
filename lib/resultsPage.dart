import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmi, @required this.result, @required this.description});

  final String bmi;
  final String result;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kResultTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(result, style: kResultTextStyle,),
                  Text(bmi, style: kBMITextStyle),
                  Text(description, style: kResultSmallTextStyle)
                ],
                ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },)
        ],
        ),
    );
  }
}