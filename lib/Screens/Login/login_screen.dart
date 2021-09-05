import 'package:community_on_demand_code_demo/Screens/CreateAccount/create_account_screen.dart';
import 'package:community_on_demand_code_demo/Widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
              LoginForm(),
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
