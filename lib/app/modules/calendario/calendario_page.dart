import 'dart:developer';

import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/helpers/drawer.dart';
import 'package:Projeto02/app/helpers/gerar_notificacoes.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/helpers/sql.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:Projeto02/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:Projeto02/app/modules/calendario/calendario_controller.dart';

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};
final controllerCalendario = Modular.get<CalendarioController>();

class _CalendarioPageState extends State<CalendarioPage>
    with TickerProviderStateMixin {
  List _selectedEvents;
  DateTime _selectDay;

  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    log('initiada aaaaaaaaaaaaaaaaaaaaa  calendarioa');
    _selectedEvents = [];
    var aux = DateTime.now();
    //final hj = new DateTime(aux.year, aux.month, aux.day);
    controllerCalendario.carregarCalendario(null);
    // .then((value) {
    //   _onDaySelected(hj, controllerCalendario.events[hj]);
    // });

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();

    // WidgetsBinding.instance.addPostFrameCallback((_) {

    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    log('fechou os controler do calendario');
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    log(events.toString());

    setState(() {
      _selectedEvents = events;
      _selectDay = day;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
    controllerCalendario.carregarCalendario(first);
    _selectedEvents = [];
  }

  // final ff = Modular.get<>();
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
      body: Observer(
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
//           Container(
//             height: 50,
//             child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child:

//                     //Text('data'),

              RaisedButton(
                child: Text('1111'),
                onPressed: () async {
                  //Modular.to.pushNamed('/cheganotificacao');
                  DBHelper _db = DBHelper();
// //controllerCalendario.
//               List<Aviso> avi = await  _db.getAvisos(1);
//               AvisoStatus();
                  // Sql().listaAvisos();
                  // Sql().listaAvisoStatus();
                  // Sql().listaNotificacoes();
                  // Notifications.cancelALL();
                  // controller.increment();
                  //  Notifications.notificaPorPushSchedule();
                  GerarNotificacoes(true);
                  //  Modular.to.pushNamed('/cheganotificacao/1');
                  // _db.listAvisoStatus();
                },
              ),
              RaisedButton(
                child: Text('222222'),
                onPressed: () async {
                  //Modular.to.pushNamed('/cheganotificacao');
                  DBHelper _db = DBHelper();
// //controllerCalendario.
//               List<Aviso> avi = await  _db.getAvisos(1);
//               AvisoStatus();
                  Sql().listaAvisoStatus();
                  // Sql().listaNotificacoes();
                  // controller.increment();
                  //  Notifications.notificaPorPushSchedule();
                  //GerarNotificacoes();

                  // _db.listAvisoStatus();
                },
              ),

              //       ),
              // ),

              // Container(
              //   height: 50,
              //   child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child:

              //           //Text('data'),

              //           RaisedButton(
              //         child: Text('p s PER'),
              //         onPressed: () {
              //           Notifications.notificaPorPushSP();
              //         },
              //       )),
              // ),

              // Container(
              //   height: 50,
              //   child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child:

              //           //Text('data'),

              //           RaisedButton(
              //         child: Text('sssssss'),
              //         onPressed: () {
              //           Notifications.notificaPorPushS();
              //         },
              //       )),
              // ),

              //

              //
              //
              // começa aqui
              //
              _buildTableCalendarWithBuilders(),
              const SizedBox(height: 8.0),
              //   _buildButtons(),
              const SizedBox(height: 8.0),
              Expanded(child: _buildEventList()),
            ],
          );
        },
      ),
      drawer: DrawerWidget.drawer(context),
    );

//     Observer(builder: (_) {
//       return Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
// //           Container(
// //             height: 50,
// //             child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child:

// //                     //Text('data'),

//           RaisedButton(
//             child: Text('1111'),
//             onPressed: () async {
//               //Modular.to.pushNamed('/cheganotificacao');
//               DBHelper _db = DBHelper();
// // //controllerCalendario.
// //               List<Aviso> avi = await  _db.getAvisos(1);
// //               AvisoStatus();
//               // controller.increment();
//               //  Notifications.notificaPorPushSchedule();
//               //GerarNotificacoes();
//               Modular.to.pushNamed('/cheganotificacao/2');
//               // _db.listAvisoStatus();
//             },
//           ),

//           //       ),
//           // ),

//           // Container(
//           //   height: 50,
//           //   child: Padding(
//           //       padding: const EdgeInsets.all(8.0),
//           //       child:

//           //           //Text('data'),

//           //           RaisedButton(
//           //         child: Text('p s PER'),
//           //         onPressed: () {
//           //           Notifications.notificaPorPushSP();
//           //         },
//           //       )),
//           // ),

//           // Container(
//           //   height: 50,
//           //   child: Padding(
//           //       padding: const EdgeInsets.all(8.0),
//           //       child:

//           //           //Text('data'),

//           //           RaisedButton(
//           //         child: Text('sssssss'),
//           //         onPressed: () {
//           //           Notifications.notificaPorPushS();
//           //         },
//           //       )),
//           // ),

//           //

//           //
//           //
//           // começa aqui
//           //
//           _buildTableCalendarWithBuilders(),
//           const SizedBox(height: 8.0),
//           //   _buildButtons(),
//           const SizedBox(height: 8.0),
//           Expanded(child: _buildEventList()),
//         ],
//       );
//     });
  }

  // Simple TableCalendar configuration (using Styles)
  // Map<DateTime, List> ddd = {};
  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pt_BR',
      calendarController: _calendarController,
      events: controllerCalendario.calendarioSemana.diaIdMap,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      // availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mês',
        CalendarFormat.week: 'SEMANA',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),

      ///BUILDERDS
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          //  print('11111ss');
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.grey.shade400,
              width: 100,
              height: 100,
              child: Text(
                '${date.day} icone',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[300],
            width: 100,
            height: 100,
            child: Text(
              '${date.day} hj',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (date.day == 25) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? pinkTrans
            : _calendarController.isToday(date) ? Colors.brown[300] : blueTrans,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  // Widget _buildButtons() {
  //   final dateTime = _events.keys.elementAt(_events.length - 2);

  //   return Column(
  //     children: <Widget>[
  //       Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: <Widget>[
  //           RaisedButton(
  //             child: Text('Month'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController.setCalendarFormat(CalendarFormat.month);
  //               });
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('2 weeks'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController
  //                     .setCalendarFormat(CalendarFormat.twoWeeks);
  //               });
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('Week'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController.setCalendarFormat(CalendarFormat.week);
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 8.0),
  //       RaisedButton(
  //         child: Text(
  //             'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
  //         onPressed: () {
  //           _calendarController.setSelectedDay(
  //             DateTime(dateTime.year, dateTime.month, dateTime.day),
  //             runCallback: true,
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildEventList() {
    return ListView.builder(
        itemCount: _selectedEvents.length,
        itemBuilder: (ctx, index) {
          Medicamento _medSelected =
              controllerCalendario.medicamentosLista.firstWhere(
            (med) => med.id == _selectedEvents[index],
          );

          var _avisosSelect = controllerCalendario
                      .calendarioSemana.medAvisoMap[_medSelected] ==
                  null
              ? null
              : controllerCalendario.calendarioSemana.medAvisoMap[_medSelected]
                  .where((ee) => ee.dia.day == _selectDay.day);

          log('sssss' + _avisosSelect.toString());

          ///AGRUPAR POR HORA

          return _avisosSelect == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            //color: blueTrans,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            // gradient: RadialGradient(
                            //     colors: [Colors.white, pinkTrans, blueTrans],
                            //     radius: 3),
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
                          height: 45,
                          width: double.infinity,
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  _medSelected.nome,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: blueTrans.shade900,
                                    //  color: Colors.grey.shade600,
                                    // color: Colors.brown.shade500,
                                    //color: pinkTrans.shade500,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      ),
                                      onPressed: null))
                            ],
                          ),
                        ),
                        ListTile(
                          title: Container(
                            // color: Colors.amber,

                            height: (_avisosSelect.length * 25).toDouble() + 30,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  //  color: Colors.grey.shade200,
                                  child:
                                      //Align(
                                      // alignment: Alignment(-0.8, 0),
                                      // child:
                                      Text(
                                    ' Dose(s) - ' +
                                        // _avisosSelect
                                        //     .elementAt(0)
                                        //     .aviso
                                        //     .qtd
                                        //     .toString() +
                                        ' ' +
                                        (_medSelected.medida == null
                                            ? 'ml'
                                            : _medSelected.medida),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  // ),
                                ),
                                Container(
                                  height:
                                      (_avisosSelect.length * 25).toDouble(),
                                  child: ListView.builder(
                                      itemCount: _avisosSelect.length,
                                      itemBuilder: (ctx, indexAviso) {
                                        AvisoStatus avisoSel =
                                            _avisosSelect.elementAt(indexAviso);
                                        log(' aviso sel :::::::' +
                                            avisoSel.toString());
                                        if (avisoSel.statusAvisoEnum ==
                                            StatusAvisoEnum.antesDeAvisar) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text('Ingerir às'),
                                                Text(avisoSel.aviso.hora
                                                        .toString() +
                                                    ':' +
                                                    avisoSel.aviso.minuto
                                                        .toString())
                                              ],
                                            ),
                                          );
                                        } else if (avisoSel.statusAvisoEnum ==
                                            StatusAvisoEnum.atrasado) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Deveria ter ingerido ás',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.red.shade400),
                                                ),
                                                Text(
                                                  avisoSel.aviso.hora
                                                          .toString() +
                                                      ':' +
                                                      avisoSel.aviso.minuto
                                                          .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          Colors.red.shade400),
                                                )
                                              ],
                                            ),
                                          );
                                        } else if (avisoSel.statusAvisoEnum ==
                                            StatusAvisoEnum.ingerido) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Ingerido às ',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .green.shade400),
                                                ),
                                                Text(
                                                  avisoSel.aviso.hora
                                                          .toString() +
                                                      ':' +
                                                      avisoSel.aviso.minuto
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors
                                                          .green.shade400),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                        return null;
                                      }),
                                )
                              ],
                            ),
                          ),
                          leading: Container(
                            margin: EdgeInsets.only(
                                top: (_avisosSelect.length * 4).toDouble()),
                            child: Icon(IconData(_medSelected.icone,
                                fontPackage: 'font_awesome_flutter',
                                fontFamily: 'FontAwesomeSolid')),
                          ),
                          onTap: () => print(' tapped! bb'),
                        )
                      ],
                    ),
                  ),
                );
        });

    // ListView(
    //   children: _selectedEvents
    //       .map((event) =>
    // Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(width: 2, color: Colors.blue),
    //               // color: Colors.blue,
    //               borderRadius: BorderRadius.circular(6.0),
    //             ),
    //             margin:
    //                 const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    //             child: ListTile(
    //               title: Text(event.toString()),
    //               //  Text(
    //               // controllerCalendario.calendarioSemana.medAvisoMap[1][0]),
    //               leading: Icon(IconData(
    //                   controllerCalendario.medicamentosLista[0].icone,
    //                   fontPackage: 'font_awesome_flutter',
    //                   fontFamily: 'FontAwesomeSolid')),
    //               onTap: () => print('$event tapped! bb'),
    //             ),
    //           ))
    //       .toList(),
    // );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.red,
    );
  }
}
