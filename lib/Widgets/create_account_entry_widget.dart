import 'package:flutter/material.dart';

class CreateAccountEntry extends StatelessWidget {
  final String entryText;
  final bool obscureText;

  CreateAccountEntry({
    this.entryText = "",
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$entryText:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            ),
          ),
        ),
      ],
      );
  }
}