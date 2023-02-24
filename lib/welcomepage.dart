import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome to Catch Me Higher"),
        ),
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
          child: Row(
            children: <Widget>[
              new ElevatedButton(
                child: new Text("Create Profile"),
                onPressed: () {
                  Navigator.pushNamed(context, 'createprofile');
                },
              ),
              new ElevatedButton(
                  child: new Text("Existing Profile"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'existingprofile');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
