import 'package:http/http.dart' as http;
import 'dart:convert';

import '../usuario.dart';

class LoginApi {
  static Future<Usuario> login(login, senha) async {
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

    return Usuario.fromJson(mapResponse);
  }
}