import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_account_info.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_profile.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/notification_settings.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinClassPage extends StatelessWidget {
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text('Join Class', style: optionStyle),
          backgroundColor: Colors.white,
        ),
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
      if (!studentInClass(code)) {
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
                      title: "Join Class",
                      content: "Join " +
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
                          child: Text('Join Class'),
                          onPressed: () {
                            joinClass(code);
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
}