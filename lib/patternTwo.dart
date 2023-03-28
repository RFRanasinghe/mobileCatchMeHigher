import 'package:flutter/material.dart';

class PatternTwoActivityPage extends StatefulWidget {
  const PatternTwoActivityPage({Key? key}) : super(key: key);

  @override
  _PatternTwoActivityState createState() => _PatternTwoActivityState();
}

class _PatternTwoActivityState extends State<PatternTwoActivityPage> {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/galaxy.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}