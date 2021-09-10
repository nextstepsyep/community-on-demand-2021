import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';
import 'badges_screen.dart';
import 'classes_screen.dart';

class ViewReportsPage extends StatelessWidget {
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
        title: Text('CARES Report', style: optionStyle),
        backgroundColor: Colors.white,
      ),
      body: new Center(
      widthFactor: screenWidth * 0.95,
      heightFactor: screenHeight * 0.95,
      child: Column(
        children: <Widget>[
          SizedBox(height: paddingHeight),
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
                        title: "STEAM Skills",
                        content: "Lorem Ipsum is simply dummy text of "
                            "the printing and typesetting industry. Lorem"
                            " Ipsum has been the industry's ",
                        actions: [],
                      ));
            },
            child: Text(
              'STEAM Skills',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: paddingHeight),
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
                        title: "Skill Count",
                        content: "Lorem Ipsum is simply dummy text of "
                            "the printing and typesetting industry. Lorem"
                            " Ipsum has been the industry's ",
                        actions: [],
                      ));
            },
            child: Text(
              'Skill Count',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: paddingHeight),
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
                        title: "Usage",
                        content: "Lorem Ipsum is simply dummy text of "
                            "the printing and typesetting industry. Lorem"
                            " Ipsum has been the industry's ",
                        actions: [],
                      ));
            },
            child: Text(
              'Usage',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: paddingHeight),
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
                        title: "Value",
                        content: "Lorem Ipsum is simply dummy text of "
                            "the printing and typesetting industry. Lorem"
                            " Ipsum has been the industry's ",
                        actions: [],
                      ));
            },
            child: Text(
              'Value',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: paddingHeight),
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
                        title: "Work-Based Experience",
                        content: "Lorem Ipsum is simply dummy text of "
                            "the printing and typesetting industry. Lorem"
                            " Ipsum has been the industry's ",
                        actions: [],
                      ));
            },
            child: Text(
              'Work-Based Experience',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: paddingHeight),
        ],
      ),
    ),
    );
  }
}