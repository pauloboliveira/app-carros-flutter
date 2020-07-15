import 'package:app_carros/util/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../usuario.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(login, senha) async {
    try {
      final url = "http://carros-springboot.herokuapp.com/api/v2/login";

      Map sendBody = {
        "username": login,
        "password": senha,
      };

      String sendJson = json.encode(sendBody);

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: sendJson,
      );

      Map mapResponse = json.decode(response.body);

      print('Response Status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Usuario usuario = Usuario.fromJson(mapResponse);

        usuario.save();       

        return ApiResponse.ok(usuario);
      }

      return ApiResponse.erro(mapResponse['error']);
    } catch (error) {
      return ApiResponse.erro("Não foi possível fazer o login");
    }
  }
}
