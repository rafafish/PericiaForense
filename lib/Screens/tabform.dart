import 'package:flutter/material.dart';

class TabForm extends StatefulWidget {
  @override
  _TabFormState createState() => _TabFormState();
}

class _TabFormState extends State<TabForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Center(child: Text('Formulário'))],
        ));
  }
}
