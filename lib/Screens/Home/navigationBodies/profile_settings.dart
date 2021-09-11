import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_profile.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_account_info.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/notification_settings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Profile Settings', style: optionStyle),
        backgroundColor: Colors.white,
      ),
      body: new Center(
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
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new EditProfile()));
                },
                child: Text(
                  'Edit Profile',
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new EditAccountInfo()));
              },
              child: Text(
                'Edit Account Info',
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new NotificationSettings()));
              },
              child: Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
