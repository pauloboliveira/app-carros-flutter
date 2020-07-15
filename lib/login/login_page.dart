import 'dart:async';
import 'package:app_carros/carro/home_page.dart';
import 'package:app_carros/login/login_bloc.dart';
import 'package:app_carros/util/alert.dart';
import 'package:app_carros/util/api_response.dart';
import 'package:app_carros/util/push.dart';
import 'package:app_carros/widgets/app_button.dart';
import 'package:app_carros/widgets/app_text_form.dart';
import 'package:flutter/material.dart';

import '../usuario.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tUsuario = TextEditingController();

  var tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  final _bloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    Future<Usuario> usuario = Usuario.get();
    usuario.then((usuarioLogado) {
      if (usuarioLogado != null) {
        push(context, HomePage(), replace: true);
      }
    });
  }

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
            AppText('Senha', 'Digite a Senha',
                password: true,
                controller: tSenha,
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return AppButton(
                  _onClickLogin,
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  showProgress: snapshot.data,
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    var usuario = tUsuario.text;
    var senha = tSenha.text;

    bool _formOk = _formKey.currentState.validate();
    if (!_formOk) {
      return;
    }

    ApiResponse response = await _bloc.login(usuario, senha);

    if (response.ok) {
      Usuario usuario = response.result;

      print('$usuario $senha');
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);      
    }
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

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
