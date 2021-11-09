import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/project_details.dart';
import 'package:community_on_demand_code_demo/Services/project_data_services.dart';
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
        stream: getProjectStream(),
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
    getProjectsData()!.forEach((key, value) {
      String id = key;
      if (!studentInProject(id)) {
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
                  builder: (context) => DetailScreen(page: ProjectDetailsPage(getName(id), "", member)),
                ),
              );
            },
            child: Text(
              getName(id),
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

  String getName(String id) {
    return "${getProjectsData()![id]!['name']}";
  }
}