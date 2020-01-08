import 'package:Projeto02/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Sobrenome'),
            onChanged: (tt){
               return controller.mudarTexto(tt);
            },
          ),
          Observer(builder: (_){
            return Text('${controller.text}');
          },)
        ],
      ),
    );
  }
}
