import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_account_info.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_profile.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/notification_settings.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/project_details.dart';
import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
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
              body: new Center(
                  child: Column(
                      children: <Widget>[
                        SizedBox(height: paddingHeight),
                        listOfWidgets(context, screenWidth)
                      ]
                  )
              )
          );
        });
  }

  Widget listOfWidgets(BuildContext context, double screenWidth) {
    List<Widget> list = <Widget>[];
    List<String> member = <String>["R1", "Ash Ketchum","Brock", "Natsu","Gon Freed", "Yayo"];
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(page: ProjectDetailsPage(getName(code), getCode(code), member)),
                ),
              );
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

  String getName(int code) {
    return "${getClassesData()![code]!['name']}";
  }

  String getCode(int code) {
    return "${getClassesData()![code]!['code']}";
  }
}