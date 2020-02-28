import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {

  RoundButton({@required this.icon, @required this.setWeight});

  final IconData icon;
  final Function setWeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: (){
        setWeight();
      },
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor( // this comes straight from material definitions.
        width: 48.0,
        height: 48.0
      ),
    );
  }
}