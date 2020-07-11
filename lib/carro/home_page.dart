import 'package:app_carros/carro/carro_api.dart';
import 'package:app_carros/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carros'),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    Future<List<Carro>> futureCarros = CarroApi.listarCarros();

    return FutureBuilder(
      future: futureCarros,
      builder: (contex, snapshot) {

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
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
                      carro.urlFoto,
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
                        onPressed: () {/* ... */},
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
}
