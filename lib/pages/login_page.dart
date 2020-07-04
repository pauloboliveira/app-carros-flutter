import 'package:app_carros/widgets/app_button.dart';
import 'package:app_carros/widgets/app_text_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tUsuario = TextEditingController();

  var tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              'Login',
              'Digite o Login',
              controller: tUsuario,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_focusSenha);
              },
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              'Senha',
              'Digite a Senha',
              password: true,
              controller: tSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha
            ),
            SizedBox(
              height: 20,
            ),
            AppButton('Login', _onClickLogin)
          ],
        ),
      ),
    );
  }

  _textFormField(
    labelText,
    hintText, {
    bool password = false,
    controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    focusNode,
    nextFocus,
    ValueChanged<String> onFieldSubmitted,
  }) {
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

  _onClickLogin() {
    var usuario = tUsuario.text;
    var senha = tSenha.text;

    bool _formOk = _formKey.currentState.validate();
    if (!_formOk) {
      return;
    }

    print('$usuario $senha');
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Login é obrigatório";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Senha é obrigatória";
    }
    return null;
  }
}
