import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profile_settings.dart';
import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeacherProfile();
}

class TeacherProfile extends State {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Center(
      widthFactor: screenWidth * 0.95,
      heightFactor: screenHeight * 0.95,
      child: Column(
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: screenWidth * 0.1,
            ),
          ),
          Text(
            'Bio Placeholder',
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
