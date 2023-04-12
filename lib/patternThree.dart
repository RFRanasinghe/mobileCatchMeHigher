import 'package:flutter/material.dart';
import 'package:mobilecatchmehigher/patternFour.dart';
import 'package:mobilecatchmehigher/patternTwo.dart';

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
              top: 30.0,
              left: 50.0,
              child: Image.asset(
                'images/pq3.jpg',
                height: 700,
                width: 320,
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
                  const EdgeInsets.only(top: 580.0, left: 30.0, right: 140.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatternTwoActivityPage()),
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
                    MaterialPageRoute(
                        builder: (context) => PatternFourActivityPage()),
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
