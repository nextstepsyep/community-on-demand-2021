//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/badges_screen.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/past_projects_screen.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profile_settings.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/view_reports_screen.dart';
import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:community_on_demand_code_demo/Services/data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';
import 'classes_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Profile();
}

class Profile extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      widthFactor: screenWidth * 0.95,
      heightFactor: screenHeight * 0.95,
      child: Column(
        children: <Widget>[
          Text(
            "${getData()['firstName']} ${getData()['lastName']}",
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: screenWidth * 0.1,
            ),
          ),
          Text(
            getData()['bio'],
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: screenWidth * 0.1,
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ClassesPage()));
            },
            child: Text(
              'Classes',
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new BadgesPage()));
            },
            child: Text(
              'Badges',
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ViewReportsPage()));
            },
            child: Text(
              'View Report',
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new PastProjects()));
            },
            child: Text(
              'Past Projects',
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ProfileSettings()));
            },
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LoginScreen()));
            },
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
