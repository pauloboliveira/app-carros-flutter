import 'dart:async';

import 'carro.dart';
import 'carro_api.dart';

class CarroBloc {

  final _streamController = StreamController();

  get stream => _streamController.stream;

  loadData(tipo) async {
    List<Carro> carros = await CarroApi.listarCarros(tipo);

    try {
      _streamController.add(carros);
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {    
    _streamController.close();
  }
}