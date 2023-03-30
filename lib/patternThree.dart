import 'package:flutter/material.dart';

class PatternThreeActivityPage extends StatefulWidget {
  const PatternThreeActivityPage({Key? key}) : super(key: key);

  @override
  _PatternThreeActivityPageState createState() =>
      _PatternThreeActivityPageState();
}

class _PatternThreeActivityPageState extends State<PatternThreeActivityPage> {
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
