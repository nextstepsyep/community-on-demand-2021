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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth> {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: <TableRow>[
                TableRow(
                  children: <CustomCell>[
                    CustomCell(text: 'Skill Type'),
                    CustomCell(text: 'Have and Used'),
                    CustomCell(text: 'Have and Didn\'t Use'),
                    CustomCell(text: 'Don\'t Have'),
                  ],
                ),
                TableRow(
                    children: <CustomCell>[
                      CustomCell(text: 'Career Awareness'),
                      CustomCell(text: '${data['awareness']!['used']}'),
                      CustomCell(text: '${data['awareness']!['didntUse']}'),
                      CustomCell(text: '${data['awareness']!['dontHave']}'),
                    ]
                ),
                TableRow(
                    children: <CustomCell>[
                      CustomCell(text: 'Innovation & Entrepreneurship'),
                      CustomCell(text: '${data['innovation']!['used']}'),
                      CustomCell(text: '${data['innovation']!['didntUse']}'),
                      CustomCell(text: '${data['innovation']!['dontHave']}'),
                    ]
                ),
                TableRow(
                    children: <CustomCell>[
                      CustomCell(text: 'Workforce Readiness'),
                      CustomCell(text: '${data['workforce']!['used']}'),
                      CustomCell(text: '${data['workforce']!['didntUse']}'),
                      CustomCell(text: '${data['workforce']!['dontHave']}'),
                    ]
                ),
                TableRow(
                    children: <CustomCell>[
                      CustomCell(text: 'STEAM Career Clusters'),
                      CustomCell(text: '${data['skill']!['used']}'),
                      CustomCell(text: '${data['skill']!['didntUse']}'),
                      CustomCell(text: '${data['skill']!['dontHave']}'),
                    ]
                ),
                TableRow(
                    children: <CustomCell>[
                      CustomCell(text: 'Leadership & Teamwork'),
                      CustomCell(text: '${data['lead']!['used']}'),
                      CustomCell(text: '${data['lead']!['didntUse']}'),
                      CustomCell(text: '${data['lead']!['dontHave']}'),
                    ]
                ),
              ]
          ),
        ));
  }
}

class CustomCell extends StatelessWidget {
  final String text;

  CustomCell({
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(child: Text(text, textAlign: TextAlign.center,)),
    );
  }
}