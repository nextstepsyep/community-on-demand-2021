import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'join_class_screen.dart';

class ClassesPage extends StatelessWidget {
  static const double paddingHeight = 20;
  static const Color barColor = Colors.white;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cookie');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return StreamBuilder<QuerySnapshot>(
        stream: getClassesStream(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: appBar(context),
              body: new Center(
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          SizedBox(height: paddingHeight),
                          listOfWidgets(context, screenWidth)
                        ]
                    )
                )
              )
          );
        });
  }

  Widget listOfWidgets(BuildContext context, double screenWidth) {
    List<Widget> list = <Widget>[];
    getClassesData()!.forEach((key, value) {
      int code = key;
      if (studentInClass(code)) {
        list.add(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth - 30, 70),
              primary: Colors.lightGreenAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.grey, width: 1),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      AlertMenu(
                        title: "Leaving class",
                        content: "Leave " +
                            "${getClassesData()![code]!['name']}" + "? (Class Code: " +
                            "${getClassesData()![code]!['code']}" + ")",
                        actions: [
                          FlatButton(
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Text('Cancel'),
                            onPressed: () {
                              print(studentInClass(code));
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            },
                          ),
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Leave Class'),
                            onPressed: () {
                              leaveClass(code);
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            },
                          ),
                        ],
                      ));
            },
            child: Text(
              joinClassButtonText(code),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }});
    return Wrap(
        spacing: 20.0, // gap between adjacent chips
        runSpacing: 20.0, // gap between lines
        children: list
    );
  }

  String joinClassButtonText(int code) {
    return (
        "${getClassesData()![code]!['name']}\n" +
            "Class Code: " +
            "(" + "${getClassesData()![code]!['code']}" + ")"
    );
  }

  AppBar appBar(BuildContext context) {
    return new AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add_circle_outline_rounded, color: Colors.black),
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      AlertMenu(
                        title: "Classes",
                        content: "Add a new class?",
                        actions: [
                          FlatButton(
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            },
                          ),
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Browse Classes'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new JoinClassPage()));
                            },
                          ),
                        ],
                      ))
            }
        ),
      ],
      centerTitle: true,
      title: Text('Classes', style: optionStyle),
      backgroundColor: Colors.white,
    );
  }
}