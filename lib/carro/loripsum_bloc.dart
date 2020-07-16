import 'package:app_carros/carro/loripsum_api.dart';
import 'package:app_carros/util/simple_bloc.dart';


class LoripsumBloc extends SimpleBloc<String>{

  

  loadText() async {

    String text = await LoripsumApi.getLoripsum();

    add(text);
  }
}