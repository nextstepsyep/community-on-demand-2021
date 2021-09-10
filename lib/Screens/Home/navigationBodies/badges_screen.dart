import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';
import 'classes_screen.dart';

class BadgesPage extends StatelessWidget {
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
        title: Text('Badges', style: optionStyle),
        backgroundColor: Colors.white,
      ),
    );
  }
}