
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertMenu extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  AlertMenu({
    this.title,
    this.content,
    this.actions = const [],
  });

  static show({BuildContext context, WidgetBuilder builder}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}