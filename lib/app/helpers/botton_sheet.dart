import 'dart:developer';

import 'package:Projeto02/app/enums/tomarMedicamentoEnum.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:Projeto02/app/modules/home/controller.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottonsSheets {
  BottonsSheets();
  //{}

  // static List<String> listTextButtons = [
  //   'Medicamento não esta próximo',
  //   'Esqueci',
  //   'Estava ocupada',
  //   'Não precisa tomar essa dose',
  //   'Reações negativas / Efeito colateral',
  //   'Para economizar',
  //   'Outros',
  // ];
  static double tamanhoContainer = 50;
  static void pullarBottomSheet(context, bool chegaNotificacao) {
    final controllerTomaMedicamento = Modular.get<TomarmedicamentoController>();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 2,
        useRootNavigator: true,
        builder: (ctx) {
          return Container(
            color: Colors.black.withOpacity(0.4),
            //  color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 90,
                      child: Center(
                        child: Text(
                          'QUAL O MOTIVO DE NÃO TOMAR ESTA DOSE ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: blueTrans.shade200,
                          // border: Border.all(
                          //   color: blueTrans.shade900,
                          //   width: 2,
                          // ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        // color: Colors.white,
                        child: ListView.builder(
                            itemCount: 7,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.pularTodos(index);
                                  } else {
                                    controllerTomaMedicamento.pular(index,
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     color: blueTrans.shade900,
                                      //     width: 2,
                                      //   ),
                                      //   borderRadius: BorderRadius.circular(12),
                                      // ),
                                      child: Center(
                                          child: Text(
                                        PularEnumConverter()
                                            .converter(PularEnum.values[index]),
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void tomarBottomSheet(context, String hora,
      DateTime dataHoraAvisoStatus, bool chegaNotificacao) {
    final controllerTomaMedicamento = Modular.get<TomarmedicamentoController>();
    final now = DateTime.now();
    final agora = now.hour.toString() + ":" + now.minute.toString();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 2,
        useRootNavigator: true,
        builder: (ctx) {
          return Container(
            color: Colors.black.withOpacity(0.4),
            //  color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              height: 330,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 90,
                      child: Center(
                        child: Text(
                          'QUANDO TOMOU SEU MEDICAMENTO ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: blueTrans.shade200,
                          // border: Border.all(
                          //   color: blueTrans.shade900,
                          //   width: 2,
                          // ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        // color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                if (chegaNotificacao) {
                                } else {
                                  controllerTomaMedicamento.tomar(
                                      dataHoraAvisoStatus,
                                      controllerTomaMedicamento.avisoStatus);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                    height: tamanhoContainer,
                                    width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: blueTrans.shade900,
                                    //     width: 2,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(12),
                                    // ),
                                    child: Center(
                                        child: Text(
                                      "TOMEI NA HORA (" + hora + ")",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          color: blueTrans.shade900,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                if (chegaNotificacao) {
                                } else {
                                  controllerTomaMedicamento.tomar(now,
                                      controllerTomaMedicamento.avisoStatus);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                    height: tamanhoContainer,
                                    width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: blueTrans.shade900,
                                    //     width: 2,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(12),
                                    // ),
                                    child: Center(
                                        child: Text(
                                      "TOMEI AGORA (" + agora + ")",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          color: blueTrans.shade900,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                                if (chegaNotificacao) {
                                } else {
                                  log('swswswswsws');
                                  DateTime dataSelecioanda =
                                      await _selectTimeDataPicker(context);
                                  controllerTomaMedicamento.tomar(
                                      dataSelecioanda,
                                      controllerTomaMedicamento.avisoStatus);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                    height: tamanhoContainer,
                                    width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: blueTrans.shade900,
                                    //     width: 2,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(12),
                                    // ),
                                    child: Center(
                                        child: Text(
                                      "ESCOLHA UMA HORA",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          color: blueTrans.shade900,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Future<DateTime> _selectTimeDataPicker(context) async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2021, 5, 5),
      onConfirm: (date) {
        return date;
      },
      currentTime: DateTime.now(),
      locale: LocaleType.pt,
    );
    return null;
  }

  static Future<DateTime> _selectTimeTomar(
      context, DateTime horaSuposta) async {
    TimeOfDay picked = await showTimePicker(
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
      context: context,
      initialTime:
          TimeOfDay(hour: horaSuposta.hour, minute: horaSuposta.minute),
    );
    if (picked != null) {
      return DateTime(horaSuposta.year, horaSuposta.month, horaSuposta.day,
          picked.hour, picked.minute);
    }
  }

  static Future<DateTime> _selectTimeAdiar(context) async {
    DateTime now = DateTime.now();
    TimeOfDay picked = await showTimePicker(
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (picked.hour > now.hour ||
          (picked.hour == now.hour && picked.minute > now.minute)) {
        return DateTime(
            now.year, now.month, now.day, picked.hour, picked.minute);
      } else {
        now.add(Duration(days: 1));
        return DateTime(
            now.year, now.month, now.day, picked.hour, picked.minute);
      }
    }
  }

  // static Future<DateTime> _selectDate(context) async {
  //   // DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  //   DateTime _dataInicio = DateTime.now();

  //   DateTime picked = await showDatePicker(
  //     context: context,
  //     //locale: Locale('pt'),
  //     initialDate: _dataInicio,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2021),
  //   );
  //   if (picked != null) {
  //     return picked;
  //   }
  // }

  static void adiarBottomSheet(context, chegaNotificacao) {
    final controllerTomaMedicamento = Modular.get<TomarmedicamentoController>();
    final now = DateTime.now();
    // final agora = now.hour.toString() + ":" + now.minute.toString();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 2,
        useRootNavigator: true,
        builder: (ctx) {
          return Container(
            color: Colors.black.withOpacity(0.4),
            //  color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 90,
                      child: Center(
                        child: Text(
                          'ADIAR PARA:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                            color: blueTrans.shade200,
                            // border: Border.all(
                            //   color: blueTrans.shade900,
                            //   width: 2,
                            // ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          // color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.adiarTodos(
                                        now.add(Duration(minutes: 5)));
                                  } else {
                                    controllerTomaMedicamento.adiar(
                                        now.add(Duration(minutes: 5)),
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     color: blueTrans.shade900,
                                      //     width: 2,
                                      //   ),
                                      //   borderRadius: BorderRadius.circular(12),
                                      // ),
                                      child: Center(
                                          child: Text(
                                        "5 MINUTOS",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.adiarTodos(
                                        now.add(Duration(minutes: 15)));
                                  } else {
                                    controllerTomaMedicamento.adiar(
                                        now.add(Duration(minutes: 15)),
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     color: blueTrans.shade900,
                                      //     width: 2,
                                      //   ),
                                      //   borderRadius: BorderRadius.circular(12),
                                      // ),
                                      child: Center(
                                          child: Text(
                                        "15 MINUTOS",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.adiarTodos(
                                        now.add(Duration(minutes: 30)));
                                  } else {
                                    controllerTomaMedicamento.adiar(
                                        now.add(Duration(minutes: 30)),
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                        "30 MINUTOS",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.adiarTodos(
                                        now.add(Duration(hours: 1)));
                                  } else {
                                    controllerTomaMedicamento.adiar(
                                        now.add(Duration(hours: 1)),
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                        "UMA HORA",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  if (chegaNotificacao) {
                                    controllerTomaMedicamento.adiarTodos(
                                        now.add(Duration(hours: 6)));
                                  } else {
                                    controllerTomaMedicamento.adiar(
                                        now.add(Duration(hours: 6)),
                                        controllerTomaMedicamento.avisoStatus);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                        "ADIAR 6 HORAS",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                  DateTime dataSelecioanda =
                                      await _selectTimeDataPicker(context);
                                  controllerTomaMedicamento.adiar(
                                      dataSelecioanda,
                                      controllerTomaMedicamento.avisoStatus);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: tamanhoContainer,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                        "ESCOLHER UMA HORA",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            color: blueTrans.shade900,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
