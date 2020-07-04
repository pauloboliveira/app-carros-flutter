import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String text;
  Function onPressed;

  AppButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        color: Colors.blue,
        onPressed: onPressed,
      ),
    );
  }
}