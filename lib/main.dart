import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mobilecatchmehigher/admin.dart';
import 'package:video_player/video_player.dart';
import 'package:mobilecatchmehigher/activityHome.dart';
import 'package:mobilecatchmehigher/createprofile.dart';
import 'package:mobilecatchmehigher/exercise.dart';
import 'package:mobilecatchmehigher/existingprofile.dart';
import 'package:mobilecatchmehigher/music.dart';
import 'package:mobilecatchmehigher/patternFour.dart';
import 'package:mobilecatchmehigher/patternRec.dart';
import 'package:mobilecatchmehigher/patternThree.dart';
import 'package:mobilecatchmehigher/patternTwo.dart';
import 'package:mobilecatchmehigher/welcomepage.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

Future<void> main() async {
  // Used Future method because of firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<LoggedInUserModel>(
      create: (context) => LoggedInUserModel(),
      child: MaterialApp(
        title: "Catch Me Higher with Down Syndrome",
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcomepage',
        routes: {
          'welcomepage': (context) => WelcomePage(),
          'createprofile': (context) => CreateProfile(),
          'existingprofile': (context) => ExistingProfile(),
          'activityHome': (context) => ActivityHome(),
          'music': (context) => MusicHomePage(),
          'exercise': (context) => ExerciseHomePage(),
          'patternRec': (context) => PatternRecognitionHomePage(),
          'patternTwo': (context) => PatternTwoActivityPage(),
          'patternThree': (context) => PatternThreeActivityPage(),
          'patternFour': (context) => PatternFourActivityPage(),
          'admin': (context) => AdminMonitorPage()
        },
      )));
}
