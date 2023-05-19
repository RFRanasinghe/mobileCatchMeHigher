import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();

  bool isButtonActive = true;

  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _conditionTypeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _activities = ['Music', 'Exercies', 'Pattern Recognition'];
  Map<String, bool> _selectedActivities = {};

  @override
  void initState() {
    super.initState();
    _activities.forEach((activity) {
      _selectedActivities[activity] = false;
    });
  }

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _conditionTypeController.dispose();
    super.dispose();
  }

  // final picker = ImagePicker();
  // late File _image;
  // late String _imageDownloadUrl;
  //   late Uint8List _imageBytes;

  // Future<void> _pickImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     setState(() async {
  //       _image = File(pickedFile.path);
  //       _imageBytes = await pickedFile.readAsBytes();
  //       _imageBytes = bytes;
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Student image inserted successfully"),
  //     ));
  //   }
  // }

  // Future<void> _uploadImage() async {
  //   if (_imageBytes == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Student Image did not get upload properlly"),
  //     ));
  //     return;
  //   }

  //   var firebase_storage;
  //   final storageRef = firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('student_images')
  //       .child(DateTime.now().toIso8601String());

  //   final uploadTask = storageRef.File(_image);
  //   final snapshot = await uploadTask.whenComplete(() => null);
  //   final downloadUrl = await snapshot.ref.getDownloadURL();

  //   setState(() {
  //     _imageDownloadUrl = downloadUrl;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Create Profile"),
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
                      controller: _idNumberController,
                      decoration: InputDecoration(
                        labelText: 'Id number',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your id number';
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your name';
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your email Address';
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
                      controller: _conditionTypeController,
                      decoration: InputDecoration(
                        labelText: "Students' state of category",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter the current state of the student';
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
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 20.0, right: 20.0, top: 2.0),
                  //   child: ElevatedButton(
                  //     onPressed: _pickImage,
                  //     child: Text("Choose Image"),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 40.0),
                        child: SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: isButtonActive
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      createData();
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0, top: 40.0),
                        child: SizedBox(
                          width: 300,
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'existingprofile');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Text(
                              "Log In",
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

  Future<void> createData() async {
    try {
      // Get a reference to the "students" collection
      final userCollection = FirebaseFirestore.instance.collection("students");

      //firebase shall generate random ids for each document
      final docRef = userCollection.doc();

      //Create the user using the email and ID number provided
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Get the authenticated user's ID
      final userId = userCredentials.user!.uid;

      await userCollection.doc(userId).set({
        "uid": userId,
        "idnumber": _idNumberController.text,
        "name": _nameController.text,
        "email": _emailController.text,
        "condition": _conditionTypeController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Student data saved successfully"),
      ));
    } catch (e) {
      // Show an error message if there was a problem
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("An error occured while saving student data"),
      ));
      print(e.toString());
    }
  }
}
