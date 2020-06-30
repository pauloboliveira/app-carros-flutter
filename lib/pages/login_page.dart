import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var tUsuario = TextEditingController();
  var tSenha = TextEditingController();

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
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _textFormField('Login', 'Digite o Login', controller: tUsuario),
          SizedBox(
            height: 10,
          ),
          _textFormField('Senha', 'Digite a Senha',
              password: true, controller: tSenha),
          SizedBox(
            height: 20,
          ),
          _button('Login', _onClickLogin)
        ],
      ),
    );
  }

  _textFormField(labelText, hintText, {bool password = false, controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }

  _button(text, onPressed) {
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

  _onClickLogin() {
    var usuario = tUsuario.text;
    var senha = tSenha.text;

    print('$usuario $senha');
  }
}
