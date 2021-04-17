import 'package:community_on_demand_code_demo/Screens/CreateAccount/create_account_screen.dart';
import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.4, 1],
              colors: [
                Color(0xFF4A67FF),
                Color(0xE17DC5FA),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.25,
              ),
              Text(
                'Community on Demand',
                style: TextStyle(
                  fontFamily: 'Cookie',
                  fontSize: screenWidth * 0.1,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username/Email:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '  Enter username here...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Forgot Username Page');
                },
                child: Text(
                  'Forgot Username?',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '  Enter password here...',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Forgot Password Page');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginScreen()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Text(
                'Don\'t have an account yet?',
                style: TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CreateAccountScreen()));
                },
                child: Text(
                  'Click here to create an account.',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
