import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:Projeto02/app/modules/hormonios/hormonios_controller.dart';

class HormoniosPage extends StatefulWidget {
  final String title;
  const HormoniosPage({Key key, this.title = "Hormonios"}) : super(key: key);

  @override
  _HormoniosPageState createState() => _HormoniosPageState();
}

class _HormoniosPageState extends State<HormoniosPage> {
  @override
  Widget build(BuildContext context) {
    final hormoniosController = Provider.of<HormoniosController>(context);

    return Container();
  }
}
