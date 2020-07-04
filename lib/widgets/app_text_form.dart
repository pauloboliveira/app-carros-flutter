import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
    String labelText;
    String hintText;
    bool password;
    TextEditingController controller;
    FormFieldValidator<String> validator;
    TextInputType keyboardType;
    TextInputAction textInputAction;
    FocusNode focusNode;
    ValueChanged<String> onFieldSubmitted;

    AppText(this.labelText, this.hintText, {this.password = false, this.controller, this.validator,
    this.keyboardType, this.textInputAction, this.focusNode, this.onFieldSubmitted});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator != null
          ? validator
          : (text) {
              if (text.isEmpty) {
                return "Esse campo é obrigatório";
              }
              return null;
            },
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}