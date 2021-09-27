import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/CardGame/card_game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';


import 'package:community_on_demand_code_demo/Screens/Home/home_screen.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/classes_screen.dart';

class CardGamePage extends StatelessWidget {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Card Game', style: optionStyle),
        backgroundColor: Colors.white,
      ),

      body: new Center(
        widthFactor: screenWidth * 0.95,
        heightFactor: screenHeight * 0.95,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - 30, 60),
                primary: Colors.white,
                elevation: 0,
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CardGameScreen()));
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - 30, 60),
                primary: Colors.white,
                elevation: 0,
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.grey, width: 1),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertMenu(
                          title: "RULES",
                          content: "swipe right to... left to... down to... up to...",
                          actions: [],
                        ));
              },
              child: Text(
                'Rules',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
