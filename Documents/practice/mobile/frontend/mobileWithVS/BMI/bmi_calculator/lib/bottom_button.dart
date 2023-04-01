import 'package:flutter/material.dart';
import 'result_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.text, required this.onPress});

  final String text;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        // ignore: prefer_const_constructors
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xFF0F52BA),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'verdana',
          ),
        ),
      ),
    );
  }
}
