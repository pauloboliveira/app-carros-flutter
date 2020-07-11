import 'package:app_carros/carro/carro.dart';

class CarroApi {

  static Future<List<Carro>> listarCarros() async {
    await Future.delayed(Duration(seconds: 2,));

    List<Carro> listaCarros = List<Carro>();

    listaCarros.add(Carro(nome: "Chevrolet Corvette", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png"));
    listaCarros.add(Carro(nome: "Chevrolet Impala Coupe", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png"));
    listaCarros.add(Carro(nome: "Cadillac Deville Convertible", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Deville_Convertible.png"));


    return listaCarros;
  }
}