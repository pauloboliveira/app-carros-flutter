import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  Function onPressed;
  Widget child;

  AppButton(this.onPressed, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        child: child,
        color: Colors.blue,
        onPressed: onPressed,
      ),
    );
  }
}