import 'package:flutter/material.dart';
import 'constants.dart';

class MFcardContent extends StatelessWidget {

  MFcardContent({@required this.cardText, @required this.cardIcon});

  final cardIcon;
  final cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardIcon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          cardText, 
          style: kCardTextStyle
          )
      ],
      );
  }
}
