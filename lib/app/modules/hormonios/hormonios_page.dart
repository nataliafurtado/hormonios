import 'package:Projeto02/app/models/medicamento.dart';
import 'package:Projeto02/app/modules/hormonios/novo_hormonio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:Projeto02/app/modules/hormonios/hormonios_controller.dart';

class HormoniosPage extends StatefulWidget {
  @override
  _HormoniosPageState createState() => _HormoniosPageState();
}

// final Map<DateTime, List> _holidays = {
//   DateTime(2019, 1, 1): ['New Year\'s Day'],
//   DateTime(2019, 1, 6): ['Epiphany'],
//   DateTime(2019, 2, 14): ['Valentine\'s Day'],
//   DateTime(2019, 4, 21): ['Easter Sunday'],
//   DateTime(2019, 4, 22): ['Easter Monday'],
// };

List<Medicamento> medicamentos = [
  Medicamento(nome: 'Perluan'),
  Medicamento(nome: 'Acetato')
];

class _HormoniosPageState extends State<HormoniosPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final hormoniosController = Provider.of<HormoniosController>(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          // color: Colors.cyanAccent.shade100,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: medicamentos.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.blue))),
                          child: Icon(Icons.autorenew, color: Colors.blue),
                        ),
                        title: Text(
                          medicamentos[index].nome,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale, color: Colors.pink),
                            Text(" Intermediate",
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0)),
                  ),
                  elevation: 2,
                );
              },
            ),
          ),
        ),
        Container(
          height: 55,
          margin: EdgeInsets.only(bottom: 15),
          //width: 300,

          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.all(const Radius.circular(20)),
          ),
          // color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              // splashColor: Colors.pink,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovoHormonioPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'ADICIONAR MEDICAMENTO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
