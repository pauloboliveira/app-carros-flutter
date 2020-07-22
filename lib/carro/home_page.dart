import 'package:app_carros/carro/carro_api.dart';
import 'package:app_carros/util/prefs.dart';
import 'package:app_carros/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'carros_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt("tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = TabController(length: 3, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carros'),
        bottom: _tabController == null
            ? null
            : TabBar(controller: _tabController, tabs: [
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
      body: TabBarView(controller: _tabController, children: [
        CarrosPage(TipoCarro.classicos),
        CarrosPage(TipoCarro.esportivos),
        CarrosPage(TipoCarro.luxo)
      ]),
      drawer: DrawerList(),
    );
  }
}
