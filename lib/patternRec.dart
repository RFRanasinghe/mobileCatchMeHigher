import 'package:flutter/material.dart';
import 'package:mobilecatchmehigher/patternTwo.dart';

class PatternRecognitionHomePage extends StatefulWidget {
  const PatternRecognitionHomePage({Key? key}) : super(key: key);

  @override
  _PatternRecognitionHomePageState createState() =>
      _PatternRecognitionHomePageState();
}

class _PatternRecognitionHomePageState
    extends State<PatternRecognitionHomePage> {
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
              top: 50,
              left: 20,
              child: Image.asset(
                'images/pq1.jpg',
                height: 500,
                width: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                  const EdgeInsets.only(top: 580.0, left: 180.0, right: 30.0),
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
}
