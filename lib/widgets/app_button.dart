import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  Function onPressed;
  Widget child;
  bool showProgress;

  AppButton(this.onPressed, this.child, {this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    if (showProgress) {
      return Container(
        height: 46,
        child: RaisedButton(
          onPressed: onPressed,
          color: Colors.blue,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      );
    } else {
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
}
