import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final cardChild;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: double.infinity,
        // ignore: sort_child_properties_last
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
