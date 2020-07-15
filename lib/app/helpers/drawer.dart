import 'package:Projeto02/app/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            child: Icon(
              FontAwesomeIcons.transgenderAlt,
              size: 50,
              color: blueTrans.shade900,
            ),
            // decoration: BoxDecoration(
            //   color: blueTrans,
            // ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.calendar,
                  size: 30,
                  color: blueTrans.shade900,
                ),
                Container(
                  width: 30,
                ),
                Text(
                  'CALENDÁRIO',
                  style: TextStyle(color: blueTrans.shade900, fontSize: 18),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);

              Modular.to.pushNamed('/calendario');
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.pills,
                  size: 30,
                  color: blueTrans.shade900,
                ),
                Container(
                  width: 30,
                ),
                Text(
                  'HORMÔNIOS',
                  style: TextStyle(color: blueTrans.shade900, fontSize: 18),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushNamed('/listaMedicamentos');
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.squareRootAlt,
                  size: 30,
                  color: blueTrans.shade900,
                ),
                Container(
                  width: 30,
                ),
                Text(
                  'TESTE NAT LINDA',
                  style: TextStyle(color: blueTrans.shade900, fontSize: 18),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushNamed('/sql');
            },
          ),
        ],
      ),
    );
  }
}
