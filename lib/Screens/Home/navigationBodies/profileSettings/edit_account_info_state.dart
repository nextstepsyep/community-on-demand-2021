import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/profileSettings/edit_account_info.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAccountInfoState extends State<EditAccountInfo> {
  TextEditingController _controller = TextEditingController();

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
        title: Text('Edit Account Info', style: optionStyle),
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
                changeUsername(context);
              },
              child: Text(
                'Change Username',
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
                changePassword(context);
              },
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // String codeDialog;
  // String valueText;

  String oldPass = '';
  String newPass = '';
  String confirmPass = '';

  Future<void> changePassword(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Password'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //position
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      oldPass = value;
                    });
                  },
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Enter Old Password"),
                ),
                SizedBox(height: paddingHeight),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      newPass = value;
                    });
                  },
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Enter New Password"),
                ),
                SizedBox(height: paddingHeight),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      confirmPass = value;
                    });
                  },
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Confirm New Password"),
                ),
              ],

            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Cancel'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    // codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  String newUsername = '';

  Future<void> changeUsername(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Username'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  newUsername = value;
                });
              },
              controller: _controller,
              decoration: InputDecoration(hintText: "Enter New Username"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Cancel'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    // codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

}