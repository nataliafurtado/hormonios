import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Projeto02/app/modules/hormonio/lista_homonios_controller.dart';
import 'package:intl/intl.dart';

//import 'package:Projeto02/lib/app/modules/hormonio/medicamento/medicamento_controller.dart';

class MedicamentoPage extends StatefulWidget {
  final String title;
  final String id;
  const MedicamentoPage({Key key, this.title = "Medicamento", this.id})
      : super(key: key);

  @override
  _MedicamentoPageState createState() => _MedicamentoPageState();
}

final controllerListaHormonios = Modular.get<ListaHomoniosController>();

class _MedicamentoPageState extends State<MedicamentoPage> {
  @override
  void initState() {
    //controllerListaHormonios.getMedicamento(int.parse(widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: () {
              Navigator.of(context).pop();
              controllerListaHormonios.apagarMedicamento(0);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.cogs),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return controllerListaHormonios.medicamentos == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(IconData(
                                controllerListaHormonios.medicamentos.icone,
                                fontPackage: 'font_awesome_flutter',
                                fontFamily: 'FontAwesomeSolid')),
                            Text(controllerListaHormonios.medicamentos.nome),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Text(
                            controllerListaHormonios.medicamentos.frequencia,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ),
                      Visibility(
                        visible:
                            controllerListaHormonios.medicamentos.frequencia ==
                                    SingletonBundle().frequencia[0]
                                ? false
                                : true,
                        child: Container(
                          height: 30,
                          child: Text(
                            controllerListaHormonios.carregaTituloDaLista(
                              controllerListaHormonios.medicamentos,
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            controllerListaHormonios.medicamentos.dosagem ==
                                    null
                                ? false
                                : true,
                        child: Container(
                          height: 30,
                          child: Text(
                            'DOSAGEM:   ' +
                                controllerListaHormonios.medicamentos.dosagem
                                    .toString() +
                                '  ' +
                                (controllerListaHormonios.medicamentos.medida !=
                                        null
                                    ? controllerListaHormonios
                                        .medicamentos.medida
                                    : ''),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Visibility(
                      //   visible:
                      //       controllerListaHormonios.medicamentos.observacoes ==
                      //               null
                      //           ? false
                      //           : true,
                      //   child: Container(
                      //     height: 30,
                      //     child: Text(
                      //       'OBS:   ' +
                      //           controllerListaHormonios
                      //               .medicamentos.observacoes,
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      Visibility(
                        visible:
                            controllerListaHormonios.medicamentos.dataInicio ==
                                    null
                                ? false
                                : true,
                        child: Container(
                          height: 30,
                          child: Text(
                            'INÍCIO:  ' +
                                _formataData(controllerListaHormonios
                                    .medicamentos.dataInicio),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            controllerListaHormonios.medicamentos.dataFim ==
                                    null
                                ? false
                                : true,
                        child: Container(
                          height: 30,
                          child: Text(
                            'FIM:  ' +
                                _formataData(controllerListaHormonios
                                    .medicamentos.dataFim),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.blue.shade200,
                        height: controllerListaHormonios
                                .medicamentos.avisos.length *
                            50.toDouble(),
                        child: ListView.builder(
                          itemCount: controllerListaHormonios
                              .medicamentos.avisos.length,
                          itemBuilder: (ctx, indexAvisos) {
                            return ListTile(
                              title: InkWell(
                                  child: Container(
                                      height: 40,
                                      child: Text(
                                        controllerListaHormonios.medicamentos
                                            .avisos[indexAvisos].hora,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              trailing: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return alertaQTDDoses(indexAvisos);
                                      //   },
                                      // );
                                    });
                                  },
                                  child: Container(
                                      height: 40,
                                      child: Text(
                                        controllerListaHormonios.medicamentos
                                                .avisos[indexAvisos].qtd
                                                .toString() +
                                            '  DOSES(S',
                                        style: TextStyle(color: Colors.blue),
                                      ))),
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: controllerListaHormonios
                            .medicamentos.avisarReabastecimento,
                        child: Container(
                          // color: Colors.brown.shade200,
                          height: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Text('AVISAR ANTES QUE ACABE',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.blue)),
                              // Text(
                              //     'ESTOQUE: ' +
                              //         controllerListaHormonios
                              //             .medicamentos.estoque
                              //             .toString(),
                              //     style:
                              //         TextStyle(fontWeight: FontWeight.bold)),
                              // Text(
                              //     'AVISAR QUANDO RESTAR: ' +
                              //         controllerListaHormonios.medicamentos
                              //             .quantidadeAntesAvisarReabastecimento
                              //             .toString(),
                              //     style:
                              //         TextStyle(fontWeight: FontWeight.bold)),
                              // Text(
                              //     'HORA DO AVISO:  ' +
                              //         controllerListaHormonios
                              //             .medicamentos.horaReabasteciemnto,
                              //     style:
                              //         TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  String _formataData(String data) {
    if (data == null) {
      return '';
    }
    DateTime t = DateTime.parse(data);
    String formattedDate = DateFormat('dd/MM/yyyy').format(t);
    //  print('11111');
    //  print(formattedDate);
    return formattedDate;
  }
}
