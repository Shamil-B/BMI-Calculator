import 'package:flutter/material.dart';
import 'input.dart';

void main() => runApp(BMIC());

class BMIC extends StatelessWidget {
  const BMIC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
      home: InputPage(),
    );
  }
}