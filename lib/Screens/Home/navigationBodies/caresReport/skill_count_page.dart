import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Services/user_data_services.dart';

class SkillCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double paddingHeight = 20;
    const Color barColor = Colors.white;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Map<String, Map<String, dynamic>> data = getUserSkillData();
    const TextStyle optionStyle = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Cookie');
    return Scaffold(
        appBar: AppBar(
          title: Text("Skill Count", style: optionStyle),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * .28),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("Have/user"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("Have/Don't use"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("Don't have"),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .28,
                      child: Text("Career Awareness"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['awareness']!["used"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['awareness']!["didntUse"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['awareness']!["dontHave"]}"),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                        width: screenWidth * .28,
                        child: Text("Innovation & Entrepreneurship")),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['innovation']!['used']}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['innovation']!['didntUse']}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['innovation']!['dontHave']}"),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .28,
                      child: Text("Workforce Readiness"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['workforce']!["used"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['workforce']!["didntUse"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['workforce']!["dontHave"]}"),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .28,
                      child: Text("STEAM Career Clusters"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['skill']!["used"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['skill']!["didntUse"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['skill']!["dontHave"]}"),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .28,
                      child: Text("Leadership & Teamwork"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['lead']!["used"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['lead']!["didntUse"]}"),
                    ),
                    SizedBox(
                      width: screenWidth * .23,
                      child: Text("${data['lead']!["dontHave"]}"),
                    )
                  ],
                ))
          ],
        ));
  }
}
