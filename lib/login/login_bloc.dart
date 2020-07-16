import 'dart:async';

import 'package:app_carros/util/api_response.dart';
import 'package:app_carros/util/simple_bloc.dart';

import '../usuario.dart';
import 'login_api.dart';

class LoginBloc extends SimpleBloc<bool>{

  Future<ApiResponse<Usuario>> login(login, senha) async {

    add(true);
    
    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}