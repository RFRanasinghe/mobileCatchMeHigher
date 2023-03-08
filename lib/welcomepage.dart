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
          child: Text(
            "Welcome to Catch Me Higher",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: SizedBox(
                  width: 400,
                  child: new ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(
                        "Create Profile",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'createprofile');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: SizedBox(
                  width: 400,
                  child: new ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(
                          "Existing Profile",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'existingprofile');
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
