import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {required this.Colour, this.cardChild, this.onPressFunction});
  final Color Colour;
  final Widget? cardChild;
  final VoidCallback? onPressFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressFunction,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colour,
        ),
        child: cardChild,
      ),
    );
  }
}
