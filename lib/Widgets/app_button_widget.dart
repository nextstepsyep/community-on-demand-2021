import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final onPressed;

  AppButton({
    this.buttonText = "",
    this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
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
    );
  }
}