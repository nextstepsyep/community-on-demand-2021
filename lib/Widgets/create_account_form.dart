import 'package:community_on_demand_code_demo/Services/auth_services.dart';
import 'package:community_on_demand_code_demo/Widgets/app_button_widget.dart';
import 'package:community_on_demand_code_demo/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);
  
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    final Decoration customBoxDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),);

    String userEmail = '';
    String userPassword = '';

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormLabel(labelText: "Email:"),
          Container(
            decoration: customBoxDecoration,
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an email address";
                } else {
                  return null;
                }
              },
              onChanged: (val) {
                setState(() => userEmail = val);
              },
            ),
          ),
          CustomFormLabel(labelText: "Password:"),
          Container(
            decoration: customBoxDecoration,
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                } else {
                  return null;
                }
              },
              onChanged: (val) {
                setState(() => userPassword = val);
              },
            ),
          ),
          AppButton(
            buttonText: "Create Account",
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: userEmail,
                    password: userPassword
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new HomeScreen()));
              } else {

              }
            },
          ),
          SizedBox(
            height: 800
          )
        ],
      ),
    );
  }
}

class CustomFormLabel extends StatelessWidget {
  final String labelText;
  
  CustomFormLabel ({
    this.labelText = "",
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          labelText,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

