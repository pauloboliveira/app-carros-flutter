import 'package:app_carros/carro/carro.dart';
import 'package:app_carros/carro/carro_page.dart';
import 'package:app_carros/util/push.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros);
  
  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => _onClickCarro(context, carro),
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

  _onClickCarro(context, carro) {
    push(context, CarroPage(carro));
  }
}
