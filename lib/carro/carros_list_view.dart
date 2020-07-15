import 'package:app_carros/carro/carro.dart';
import 'package:app_carros/carro/carro_bloc.dart';
import 'package:app_carros/carro/carro_page.dart';
import 'package:app_carros/util/push.dart';
import 'package:app_carros/util/text_error.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosListView extends StatefulWidget {
  String tipoCarro;

  CarrosListView(this.tipoCarro);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
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

        return _listView(carros);
      },
    );
  }

  _listView(carros) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Carro carro = carros[index];

          return Card(
            color: Colors.grey[350],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      carro.urlFoto ??
                          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    carro.nome,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    'descrição...',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () => _onClickCarro(carro),
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: carros.length,
      ),
    );
  }

  _onClickCarro(carro) {
    push(context, CarroPage(carro));
  }
}
