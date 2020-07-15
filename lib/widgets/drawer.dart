import 'package:app_carros/login/login_page.dart';
import 'package:app_carros/util/push.dart';
import 'package:flutter/material.dart';

import '../usuario.dart';

class DrawerList extends StatelessWidget {
  _header(usuario) {
    return UserAccountsDrawerHeader(
      accountName: Text(usuario.nome),
      accountEmail: Text(usuario.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(usuario.urlFoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Usuario> futureUsuario = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: futureUsuario,
              builder: (context, snapshot) {
                Usuario usuario = snapshot.data;

                return usuario != null ? _header(usuario) : Container();

              },
            ),            
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              subtitle: Text('Meus itens favoritos'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('Tire suas dúvidas'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout(context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
