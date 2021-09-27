import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CardGame.dart';

class CardGameScreen extends StatefulWidget {
  @override
  CardGameScreenState createState() => CardGameScreenState();
}

class CardGameScreenState extends State<CardGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar

      // stuff
      body: Center(
        child: CardGame()
      ),
    );
  }

}