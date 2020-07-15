import 'dart:async';

import 'package:app_carros/util/api_response.dart';

import '../usuario.dart';
import 'login_api.dart';

class LoginBloc {

  
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(login, senha) async {

     _streamController.add(true);
    
    ApiResponse response = await LoginApi.login(login, senha);

    _streamController.add(false);

    return response;

  }

  void dispose() {    
    _streamController.close();
  }
}