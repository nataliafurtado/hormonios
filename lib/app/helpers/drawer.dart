import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerWidget {
  // Notifications() {
  //   iniciarConfiguracoes();
  // }

  static Drawer drawer(context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('TRANS.APP'),
            decoration: BoxDecoration(
              color: Color(0xffffb5cb),
            ),
          ),
          ListTile(
            title: Text('CALENDÁRIO'),
            onTap: () {
              Navigator.pop(context);

              Modular.to.pushNamed('/calendario');
            },
          ),
          ListTile(
            title: Text('HORMÔNIOS'),
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushNamed('/listaMedicamentos');
            },
          ),
        ],
      ),
    );
  }
}
