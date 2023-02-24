//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mobilecatchmehigher/createprofile.dart';
import 'package:mobilecatchmehigher/existingprofile.dart';
import 'package:mobilecatchmehigher/welcomepage.dart';

void main() {
  runApp(MaterialApp(
    title: "Catch Me Higher with Down Syndrome",
    debugShowCheckedModeBanner: false,
    initialRoute: 'welcomepage',
    routes: {
      'welcomepage': (context) => WelcomePage(),
      'createprofile': (context) => CreateProfile(),
      'existingprofile': (context) => ExistingProfile()
    },
  ));
}
