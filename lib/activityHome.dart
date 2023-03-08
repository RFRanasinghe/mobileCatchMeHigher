import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({Key? key}) : super(key: key);

  @override
  _ActivityHomeState createState() => _ActivityHomeState();
}

class _ActivityHomeState extends State<ActivityHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Activity Home",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/galaxy.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
