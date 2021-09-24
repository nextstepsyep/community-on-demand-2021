import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
import 'classes_screen.dart';

class JoinClassPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
          onPressed: () => {
          Navigator.push(
          context,
          new MaterialPageRoute(
          builder: (context) => new ClassesPage()))
          },
        ),
        centerTitle: true,
        title: Text('Join Class', style: optionStyle),
        backgroundColor: Colors.white,
      ),
    );
  }
}