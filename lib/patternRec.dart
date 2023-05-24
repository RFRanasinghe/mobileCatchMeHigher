//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter_sound/flutter_sound.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobilecatchmehigher/activityHome.dart';
import 'package:mobilecatchmehigher/patternTwo.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

class PatternRecognitionHomePage extends StatefulWidget {
  const PatternRecognitionHomePage({Key? key}) : super(key: key);

  @override
  _PatternRecognitionHomePageState createState() =>
      _PatternRecognitionHomePageState();
}

class _PatternRecognitionHomePageState
    extends State<PatternRecognitionHomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  var correctAnswer = false;
  var incorrectAnswer = false;

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<LoggedInUserModel>(context);
    if (loggedIn.loggedInUser == null || loggedIn.loggedInUser!.uid!.isEmpty) {
      if (!_navigatorKey.currentState!.userGestureInProgress) {
        Navigator.pushNamed(context, 'userlogin');
        return Container();
      }
      return Container();
    } else {
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
                top: 160,
                left: 20,
                child: Image.asset(
                  'images/pq1.jpg',
                  height: 400,
                  width: 390,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 50),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 24, left: 6),
                          child: ElevatedButton.icon(
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
                padding: const EdgeInsets.only(top: 530.0),
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
                        handleCorrectButtonPress();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Studet data tracked successfully"),
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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Try Again"),
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
                    const EdgeInsets.only(top: 600.0, left: 200.0, right: 30.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatternTwoActivityPage()),
                    );
                  },
                  child: Image.asset(
                    'images/right.jpg',
                    width: 60.0,
                    height: 60.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
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
          Navigator.pushNamed(context, 'patternTwo'),
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
