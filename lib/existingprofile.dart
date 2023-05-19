import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

class ExistingProfile extends StatefulWidget {
  const ExistingProfile({Key? key}) : super(key: key);

  @override
  _ExistingProfileState createState() => _ExistingProfileState();
}

class _ExistingProfileState extends State<ExistingProfile> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final _formKey = GlobalKey<FormState>();
  // User? _loggedInUser;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _errorMessage = "";
    });

    final form = _formKey.currentState;
    if (form!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        var user;
        try {
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          user = userCredential.user;
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid email or password")));
          print(e.toString());
        }
        final uid = user!.uid;
        if (user != "") {
          var loggedInUserModel =
              Provider.of<LoggedInUserModel>(context, listen: false);
          loggedInUserModel.setLoggedInUser(
            AppUser(
              email: email,
              uid: uid,
            ),
            email: email,
            uid: uid,
          );
        } else {
          throw 'User is null';
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Log in successful"),
        ));

        Navigator.pushNamed(context, 'activityHome');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Log in failed"),
        ));
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Existing Profile"),
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
          child: Padding(
            padding: EdgeInsets.all(7.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 2.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter the correct email';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 2.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter the correct password';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 40.0),
                        child: SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              _submit();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
