import 'package:community_on_demand_code_demo/Screens/Home/home_screen.dart';
import 'package:community_on_demand_code_demo/Services/auth_services.dart';
import 'package:community_on_demand_code_demo/Widgets/app_button_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String userEmail = '';
    String userPassword = '';

    return Form(
      key: _formKey,
        child: Column(
            children: [
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
                child: Material(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Enter username here...',
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email address";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? val) {
                      userEmail = val!;
                    },
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
                child: Material(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Enter password here...',
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? val) {
                      userPassword = val!;
                    }
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
              AppButton(
                buttonText: 'Login',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                  await signIn(_emailController.text, _passwordController.text);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new HomeScreen()));
                  } else {
                    print("Not validated");
                  }
                },
              ),
            ],
          ),
    );
  }
}