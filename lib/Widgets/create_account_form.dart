import 'package:flutter/material.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);
  
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final Decoration customBoxDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormLabel(labelText: "Username:"),
          Container(
            decoration: customBoxDecoration,
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a username";
                } else {
                  return null;
                }
              },
            ),
          ),
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

