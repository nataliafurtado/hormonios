import 'dart:developer';

import 'package:Projeto02/app/helpers/botton_sheet.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tomarmedicamento_controller.dart';

class TomarmedicamentoPage extends StatefulWidget {
  final String title;
  final String id;

  const TomarmedicamentoPage(
      {Key key, this.title = "Tomarmedicamento", this.id})
      : super(key: key);

  @override
  _TomarmedicamentoPageState createState() => _TomarmedicamentoPageState();
}

class _TomarmedicamentoPageState
    extends ModularState<TomarmedicamentoPage, TomarmedicamentoController> {
  //use 'controller' variable to access controller
  double fontSize = 14;
  Color iconsText = blueTrans.shade900;
  double iconSize = 35;
  Color container = Colors.white;
  Color text = Colors.grey.shade600;
  double alturaContainer = 40;

  final controllerTomaMedicamento = Modular.get<TomarmedicamentoController>();
  @override
  void initState() {
    controllerTomaMedicamento.carregaStatusAviso(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueTrans,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 10,
            ),
            transIconContainer(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Observer(builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                      //  color: container,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: 400,
                  child: controllerTomaMedicamento.avisoStatus == null
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: container,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  controllerTomaMedicamento
                                      .avisoStatus.medicamento.nome,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: blueTrans.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Icon(
                                          IconData(
                                              controllerTomaMedicamento
                                                  .avisoStatus
                                                  .medicamento
                                                  .icone,
                                              fontPackage:
                                                  'font_awesome_flutter',
                                              fontFamily: 'FontAwesomeSolid'),
                                          color: iconsText,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            //color: Color(0xffffb5cb),
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20, top: 30),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  // color: Colors.red,
                                                  height: alturaContainer,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Icon(
                                                        Icons.calendar_today,
                                                        color: text,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: Text(
                                                          montarDataHoraAviso(),
                                                          style: TextStyle(
                                                              color: text,
                                                              fontSize: 15),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.red,
                                                  height: alturaContainer,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Icon(
                                                        FontAwesomeIcons.listUl,
                                                        color: text,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: Text(
                                                          'aaaaa',
                                                          style: TextStyle(
                                                              color: text,
                                                              fontSize: 15),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.red,
                                                  height: alturaContainer,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: text,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: Text(
                                                          'aaaaa',
                                                          style: TextStyle(
                                                              color: text,
                                                              fontSize: 15),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.red,
                                                  height: alturaContainer,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Icon(
                                                        Icons.watch,
                                                        color: text,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        //  color: Colors.indigo,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: Text(
                                                          'Tomado por ás 20:15, ontem, 11 de ABR',
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                              color: text,
                                                              fontSize: 15),
                                                          maxLines: 2,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                            botoes(),
                          ],
                        ),
                );
              }),
            ),
            botao5minutos(),
            transIconContainer(),
          ],
        ),
      ),
    );
  }

  Widget transIconContainer() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 10),
      //  color: Colors.red,
      child: Icon(
        FontAwesomeIcons.transgenderAlt,
        size: 40,
        color: container,
      ),
    );
  }

  Widget botao5minutos() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2,
          child: Container(
            height: 90,
            width: double.infinity,
            // width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.watch_later,
                  color: iconsText,
                  size: iconSize,
                ),
                Text(
                  'ADIAR 5 MINUTOS',
                  style: TextStyle(
                    color: iconsText,
                    fontSize: fontSize,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget botoes() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: container,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child:
          // Padding(
          //  padding: const EdgeInsets.all(5.0),
          //  child:
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              BottonsSheets.pullarBottomSheet(context, false);
            },
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: iconsText,
                    size: iconSize,
                  ),
                  Text(
                    'PULAR',
                    maxLines: 2,
                    style: TextStyle(
                      color: iconsText,
                      fontSize: fontSize,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              BottonsSheets.tomarBottomSheet(context, montarDataHora(),
                  controllerTomaMedicamento.avisoStatus.dia, false);
            },
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: iconsText,
                    size: iconSize,
                  ),
                  Text(
                    'TOMAR',
                    style: TextStyle(
                      color: iconsText,
                      fontSize: fontSize,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              BottonsSheets.adiarBottomSheet(context);
              // Modular.to.pushNamed('/');
              // Modular.to.pushNamedAndRemoveUntil(
              //     '/', (Route<dynamic> route) => false);
              // Modular.to.pushReplacementNamed('/medicamento');
              // Navigator.pop(context);
              // Navigator.pop(context);
            },
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.watch_later,
                    color: iconsText,
                    size: iconSize,
                  ),
                  Text(
                    'ADIAR',
                    style: TextStyle(
                      color: iconsText,
                      fontSize: fontSize,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //  ),
    );
  }

  String montarDataHoraAviso() {
    return 'Tomar ás ' +
        controllerTomaMedicamento.avisoStatus.aviso.hora.toString() +
        ':' +
        controllerTomaMedicamento.avisoStatus.aviso.minuto.toString() +
        ', ' +
        hoje(controllerTomaMedicamento.avisoStatus.dia) +
        controllerTomaMedicamento.avisoStatus.dia.day.toString() +
        ' de ' +
        abreviacaoDemes(controllerTomaMedicamento.avisoStatus.dia.month);
    //return controllerTomaMedicamento.avisoStatus.dia.toString();
  }

  String montarDataHora() {
    return controllerTomaMedicamento.avisoStatus.aviso.hora.toString() +
        ':' +
        controllerTomaMedicamento.avisoStatus.aviso.minuto.toString();
    //return controllerTomaMedicamento.avisoStatus.dia.toString();
  }

  String hoje(DateTime dia) {
    final now = DateTime.now();
    log(dia.day.toString());
    if (now.day == dia.day && now.month == dia.month) {
      return 'hoje, ';
    }
    return '';
  }

  String abreviacaoDemes(int mes) {
    if (mes == 1) {
      return 'JAN';
    } else if (mes == 2) {
      return 'FEV';
    } else if (mes == 3) {
      return 'MAR';
    } else if (mes == 4) {
      return 'ABR';
    } else if (mes == 5) {
      return 'MAI';
    } else if (mes == 6) {
      return 'JUN';
    } else if (mes == 7) {
      return 'JUL';
    } else if (mes == 8) {
      return 'AGO';
    } else if (mes == 9) {
      return 'SET';
    } else if (mes == 10) {
      return 'OUT';
    } else if (mes == 11) {
      return 'NOV';
    } else if (mes == 12) {
      return 'DEZ';
    }
  }
}
