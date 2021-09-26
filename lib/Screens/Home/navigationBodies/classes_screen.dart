import 'package:community_on_demand_code_demo/Features/AlertMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'join_class_screen.dart';

class ClassesPage extends StatelessWidget {
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
      ),
    );
  }
}