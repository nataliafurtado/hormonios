import 'dart:developer';

import 'package:Projeto02/app/helpers/drawer.dart';
import 'package:Projeto02/app/helpers/sql.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:flutter/material.dart';

class SqlTeste extends StatefulWidget {
  @override
  _SqlTesteState createState() => _SqlTesteState();
}

class _SqlTesteState extends State<SqlTeste> {
  @override
  void initState() {
    super.initState();
    log('initiada sssqqqllllll');
  }

  int id;
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    //final hormoniosController = Provider.of<HormoniosController>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  //stops: [1, 2],
                  colors: [
                    blueTrans,
                    pinkTrans,
                    Colors.white,
                    //  Colors.white,
                    pinkTrans,
                    blueTrans
                  ]),
            ),
          ),
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'APP TRANS',
                style: TextStyle(color: blueTrans.shade900),
              ),
              Container(
                width: 50,
              )
            ],
          ))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   width: 100,
            //   child: TextField(
            //     onChanged: (ss) {
            //       setState(() {
            //         id = int.parse(ss);
            //       });
            //     },
            //     decoration: InputDecoration(
            //         border: InputBorder.none, hintText: 'Digite aqui'),
            //     style: TextStyle(color: blueTrans.shade900, fontSize: 20),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('AviS'),
                  onPressed: () async {
                    log('message');

                    list = await Sql().listaAvisoStatus();
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('NotiSQL'),
                  onPressed: () async {
                    log('message');

                    list = await Sql().listaNotificacoes();
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('AVISO'),
                  onPressed: () async {
                    log('message');

                    list = await Sql().listaAvisos();
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('MEDS'),
                  onPressed: () async {
                    log('message');

                    list = await Sql().listaMeds();
                    setState(() {});
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('NotNot'),
                  onPressed: () async {
                    log('message');

                    list = await Sql().listaNotNot();
                    setState(() {});
                  },
                ),
              ],
            ),
            Container(
              color: Colors.cyan,
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, index) {
                    return Text(list[index]);
                  }),
            )
          ],
        ),
      ),
      drawer: DrawerWidget.drawer(context),
    );
  }
}
