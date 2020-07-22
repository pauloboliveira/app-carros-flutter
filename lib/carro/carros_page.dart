import 'package:app_carros/carro/carro.dart';
import 'package:app_carros/carro/carro_bloc.dart';
import 'package:app_carros/util/text_error.dart';
import 'package:flutter/material.dart';

import 'carros_list_view.dart';

// ignore: must_be_immutable
class CarrosPage extends StatefulWidget {
  String tipoCarro;

  CarrosPage(this.tipoCarro);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _bloc = CarroBloc();

  @override
  void initState() {
    super.initState();
    _bloc.loadData(widget.tipoCarro);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body(widget.tipoCarro);
  }

  _body(String tipoCarro) {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (contex, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.loadData(widget.tipoCarro);
  }
}
