import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'classes_screen.dart';

class JoinClassPage extends StatelessWidget {
  // final CollectionReference _classData =
  // FirebaseFirestore.instance.collection("class");
  // Stream<DocumentSnapshot> _stream = _classData.doc(_uid).snapshots();
  // Map<String, dynamic> _data = Map();
  //
  // Future updateProfile(String firstName, String lastName, String bio) async {
  //   return await _userData
  //       .doc(_uid)
  //       .set({'firstName': firstName, 'lastName': lastName, 'bio': bio});
  // }

  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Join Class', style: optionStyle),
        backgroundColor: Colors.white,
      ),
    );
  }
}