import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  bool isButtonActive = true;
  //final FirebaseStorage storage = FirebaseStorage.instance;
  //final Reference ref = storage.ref().child('students');

  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _conditionTypeController = TextEditingController();

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _conditionTypeController.dispose();
    super.dispose();
  }

  //final databaseRef = FirebaseDatabase.instance.reference();

  final _formKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.all(20.0),
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
                      onSaved: (value) {
                        //_name = value;
                      },
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
                    //child: ElevatedButton(onPressed: onPressed, child: child),
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
                              createData();
                              //* if (_idNumberController == null &&
                              //     _nameController == null &&
                              //     _emailController == null &&
                              //     _conditionTypeController == null) {
                              //   insertData(
                              //       _idNumberController as String,
                              //       _nameController as String,
                              //       _emailController as String,
                              //       _conditionTypeController as String);
                              //* }
                            },
                            //   onPressed: isButtonActive ? () {
                            //     if(_formKey.currentState!.validate()) {
                            //       insertData();
                            //     }
                            //   }
                            // : null,
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
                              Navigator.pushNamed(context, 'activityHome');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Text(
                              "Activity Home",
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

    //   Future<void> submitForm() async {
    //   final txtName = _nameController.value.text;
    //   final txtemail = _emailController.value.text;
    //   final txtid_number = _idNumberController.value.text;
    //   final txtcondition_type = _conditionTypeController.value.text;

    //   //convert XFIle to file

    //   uploadFile(
    //     txtName,
    //     txtemail,
    //     txtid_number,
    //     txtcondition_type,
    //   );
    // }
  }

  Future createData() async {
    final userCollection = FirebaseFirestore.instance.collection("students");

    final docRef = userCollection
        .doc(); //firebase shall generate random ids for each document

    await docRef.set({
      "idnumber": _idNumberController.text,
      "name": _nameController.text,
      "email": _emailController.text,
      "condition": _conditionTypeController.text
    });
  }

  //* void insertData(
  //     String id_number, String name, String email, String condition) {
  //   databaseRef.child("path").set({
  //     'id_number': id_number,
  //     'name': name,
  //     'email': email,
  //     'condition_type': condition,
  //   });
  //* }

  // uploadFile(txtName, txtEmail, txtid_number, txtcondition_type) async {
  //   // upload file to firebase storage
  //   //create reference to the firebase storage bucket
  //   final FirebaseStorage storage = FirebaseStorage.instance;
  //   final Reference storageReference =
  //       storage.ref().child('profile_pictures_of_dss');

  //   if (files.isNotEmpty) {
  //     final imageXFile = files.last;
  //     //upload file
  //     final file = File(imageXFile.path);
  //     final TaskSnapshot taskSnapshot = await storageReference.putFile(file);

  //     final imageURL =
  //         await taskSnapshot.ref.getDownloadURL(); //get download url

  //     DatabaseReference reference =
  //         FirebaseDatabase.instance.reference().child('Students');

  //     reference
  //         .push()
  //         .set({
  //           'name': txtName,
  //           'email': txtEmail,
  //           'id_number': txtid_number,
  //           'condition_type': txtcondition_type,
  //           'imageURL': imageURL
  //         })
  //         .then((value) => {
  //               //data successfully submitted
  //               print('Data stored successfully')
  //             })
  //         .catchError((error) {
  //           //handle error
  //           print('Data did not get saved successfully');
  //         });
  //   } else {}
  // }
}
