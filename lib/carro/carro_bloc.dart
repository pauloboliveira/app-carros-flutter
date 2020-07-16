import 'package:app_carros/util/simple_bloc.dart';

import 'carro.dart';
import 'carro_api.dart';

class CarroBloc extends SimpleBloc<List<Carro>>{

  loadData(tipo) async {
    List<Carro> carros = await CarroApi.listarCarros(tipo);

    try {
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}