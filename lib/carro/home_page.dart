import 'package:app_carros/carro/carro_api.dart';
import 'package:app_carros/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'carros_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Carros'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
            Tab(
              text: 'Clássicos',
            ),
            Tab(
              text: 'Esportivos',
            ),
            Tab(
              text: 'Luxo',
            ),
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo)
        ]),
        drawer: DrawerList(),
      );
  }
}
