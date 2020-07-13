import 'package:app_carros/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TipoCarro {
  static final String classicos = "classicos"; 
  static final String esportivos = "esportivos";
  static final String luxo = "luxo"; 
}

class CarroApi {

  static Future<List<Carro>> listarCarros(String tipoCarro) async {
    try {
      final url = "http://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipoCarro";
      List<Carro> listaCarros = List<Carro>();

      var response = await http.get(url);

      List lista = json.decode(response.body);

      listaCarros = lista.map((map) => Carro.fromJson(map)).toList();

      return listaCarros;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
