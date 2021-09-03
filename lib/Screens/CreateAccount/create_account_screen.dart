import 'package:community_on_demand_code_demo/Screens/Home/home_screen.dart';
import 'package:community_on_demand_code_demo/Widgets/create_account_entry_widget.dart';
import 'package:community_on_demand_code_demo/Widgets/app_button_widget.dart';
import 'package:community_on_demand_code_demo/Widgets/create_account_form.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Create Account',
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: 40.0,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xFFF0F0F0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CreateAccountForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
