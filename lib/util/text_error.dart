import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextError extends StatelessWidget {
  String msg;

  TextError(this.msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          msg,
          style: TextStyle(
            color: Colors.red,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
