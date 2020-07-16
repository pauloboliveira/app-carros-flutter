import 'package:app_carros/carro/loripsum_bloc.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

// ignore: must_be_immutable
class CarroPage extends StatefulWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _blocLoripsumApi = LoripsumBloc();

  @override
  void initState() {    
    super.initState();

    _blocLoripsumApi.loadText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton(
              onSelected: (value) => _onClickMenuPopup(value),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Editar"),
                    value: "Editar",
                  ),
                  PopupMenuItem(
                    child: Text("Deletar"),
                    value: "Deletar",
                  ),
                  PopupMenuItem(
                    child: Text("Share"),
                    value: "Share",
                  ),
                ];
              }),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Image.network(widget.carro.urlFoto),
          _infoCar(),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          _textInfo()
        ],
      ),
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickMenuPopup(value) {
    switch (value) {
      case "Editar":
        break;
      case "Deletar":
        break;
      case "Share":
        break;
    }
  }

  _infoCar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.carro.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.carro.tipo,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }

  _textInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.carro.descricao,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: _blocLoripsumApi.stream,
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Text(snapshot.data, style: TextStyle(fontSize: 16),);
            },
          ),
        ],
      ),
    );
  }
}
