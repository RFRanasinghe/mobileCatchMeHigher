import 'package:flutter/material.dart';

class PatternRecognitionHomePage extends StatefulWidget {
  const PatternRecognitionHomePage({Key? key}) : super(key: key);

  @override
  _PatternRecognitionHomePageState createState() => _PatternRecognitionHomePageState();
}

class _PatternRecognitionHomePageState extends State<PatternRecognitionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Pattern Recognition Page",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
