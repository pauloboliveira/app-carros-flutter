import 'package:flutter/material.dart';

import 'carro.dart';

// ignore: must_be_immutable
class CarroPage extends StatelessWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Image.network(carro.urlFoto),
      ),
    );
  }
}