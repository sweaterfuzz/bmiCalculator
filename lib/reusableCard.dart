import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  
  ReusableCard({@required this.cardColor, this.cardChild, this.onTap});

  final Color cardColor;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
        )
      ),
    );
  }
}
