//import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilecatchmehigher/activityHome.dart';
import 'package:mobilecatchmehigher/patternThree.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

class PatternFourActivityPage extends StatefulWidget {
  const PatternFourActivityPage({Key? key}) : super(key: key);

  @override
  _PatternFourActivityPageState createState() =>
      _PatternFourActivityPageState();
}

class _PatternFourActivityPageState extends State<PatternFourActivityPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  var correctAnswer = false;
  var incorrectAnswer = false;

  int buttonSelected = -1;

  void onButtonPressed(int indexButton) {
    setState(() {
      buttonSelected = indexButton;
    });
  }

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
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  top: 20.0, left: 20.0, bottom: 20, right: 20.0),
            ),
            Positioned(
              top: 150.0,
              left: 50.0,
              child: Image.asset(
                'images/pattern4.png',
                height: 400,
                width: 320,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36, left: 60),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Select the next correct pattern?",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.try_sms_star_sharp),
                        onPressed: () {
                          resetScoreAgain();
                        },
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Try Again",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 1, 37, 66),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivityHome()),
                          );
                        },
                        icon: Icon(Icons.stop_sharp),
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "FINISH",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 2, 66, 27),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Try Again"),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 13, 58, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "a",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Try Again"),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 185, 198, 186),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "b",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Try Again"),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 234, 169, 85),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "c",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      handleCorrectButtonPress();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Studet data tracked successfully"),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 7, 133),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "d",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 580.0, left: 30.0, right: 140.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatternThreeActivityPage()),
                  );
                },
                child: Image.asset(
                  'images/left.jpg',
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 580.0, left: 300.0, right: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityHome()),
                  );
                },
                child: Image.asset(
                  'images/right.jpg',
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleCorrectButtonPress() async {
    setState(() {
      correctAnswer = true;
    });
    final uid = Provider.of<LoggedInUserModel>(context, listen: false)
        .loggedInUser!
        .uid;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('scores')
          .where('uid', isEqualTo: uid)
          .where('date',
              isEqualTo: DateTime.now().toIso8601String().substring(0, 10))
          .limit(1)
          .get();

      final snapshot = await docRef;

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        if (data.containsKey('patternRecognitionMarks')) {
          final currentMarks = data['patternRecognitionMarks'] as int;
          await doc.reference
              .update({'patternRecognitionMarks': currentMarks + 1});
        } else {
          await doc.reference.update({'patternRecognitionMarks': 1});
        }
      } else {
        await FirebaseFirestore.instance.collection('scores').add({
          'uid': uid,
          'patternRecognitionMarks': 1,
          'date': DateTime.now().toIso8601String().substring(0, 10),
        });
      }
    } catch (error) {
      print('Error updating marks: $error');
    }

    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            correctAnswer = false;
          }),
          Navigator.pushNamed(context, 'activityHome'),
        });
  }

  Future<void> resetScoreAgain() async {
    final uid = Provider.of<LoggedInUserModel>(context, listen: false)
        .loggedInUser!
        .uid;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('scores')
          .where('uid', isEqualTo: uid)
          .where('date',
              isEqualTo: DateTime.now().toIso8601String().substring(0, 10))
          .limit(1)
          .get();

      final snapshot = await docRef;

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        if (data.containsKey('patternRecognitionMarks')) {
          final currentMarks = data['patternRecognitionMarks'] as int;
          await doc.reference.update({'patternRecognitionMarks': 0});
        } else {
          await doc.reference.update({'patternRecognitionMarks': 0});
        }
      } else {
        await FirebaseFirestore.instance.collection('scores').add({
          'uid': uid,
          'patternRecognitionMarks': 0,
          'date': DateTime.now().toIso8601String().substring(0, 10),
        });
      }
      Navigator.pushNamed(context, 'patternRecognition');
    } catch (error) {
      print('Error updating marks: $error');
    }
  }
}
