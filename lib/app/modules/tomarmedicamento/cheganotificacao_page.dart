import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/botton_sheet.dart';
import 'package:Projeto02/app/helpers/styles.dart';
import 'package:Projeto02/app/modules/tomarmedicamento/tomarmedicamento_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'cheganotificacao_controller.dart';

class CheganotificacaoPage extends StatefulWidget {
  final String title;
  final String id;
  const CheganotificacaoPage(
      {Key key, this.title = "Cheganotificacao", this.id})
      : super(key: key);

  @override
  _CheganotificacaoPageState createState() => _CheganotificacaoPageState();
}

class _CheganotificacaoPageState
    extends ModularState<CheganotificacaoPage, TomarmedicamentoController> {
  final controllerChegaNotificacao = Modular.get<TomarmedicamentoController>();
  @override
  void initState() {
    controllerChegaNotificacao.carregaNotificacao(widget.id);
    super.initState();
  }

  Color iconsText = blueTrans.shade900;
  double iconSize = 35;
  Color container = Colors.white;
  double fontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      backgroundColor: blueTrans,
      body: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   //  color: Colors.blue.shade50,
            //   child: Column(
            //     children: <Widget>[
            //       Container(
            //         margin: const EdgeInsets.only(top: 60.0),
            //         // height: 100,
            //         child: Text(
            //           'Título reportagem trans',
            //           style: TextStyle(
            //             fontSize: 20,
            //             // fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.all(20),
            //         child: Text(
            //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 4,
            //         ),
            //       ),
            //       Container(
            //         child: Text(
            //           'www.link.com.br',
            //           style: TextStyle(
            //             color: Colors.blue,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            transIconContainer(),
            controllerChegaNotificacao.notificacao == null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    height: tamanhoContainer(controllerChegaNotificacao
                        .notificacao.avisosStatus.length),
                    decoration: BoxDecoration(
                        //   color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              controllerChegaNotificacao.notificacao.dia.hour
                                      .toString() +
                                  ':' +
                                  controllerChegaNotificacao
                                      .notificacao.dia.minute
                                      .toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              //  color: Color(0xffffb5cb),
                              color: Colors.white,
                              child: ListView.builder(
                                  itemCount: controllerChegaNotificacao
                                      .notificacao.avisosStatus.length,
                                  itemBuilder: (ctx, index) {
                                    return Card(
                                      child: ListTile(
                                        onTap: () {
                                          int id = controllerChegaNotificacao
                                              .notificacao
                                              .avisosStatus[index]
                                              .id;
                                          Modular.to
                                              .pushNamed('/tomarmedicacao/$id');
                                        },
                                        leading: Icon(IconData(
                                            controllerChegaNotificacao
                                                .notificacao
                                                .avisosStatus[index]
                                                .medicamento
                                                .icone,
                                            fontPackage: 'font_awesome_flutter',
                                            fontFamily: 'FontAwesomeSolid')),
                                        title: Text(controllerChegaNotificacao
                                            .notificacao
                                            .avisosStatus[index]
                                            .medicamento
                                            .nome),
                                        subtitle: Text(
                                            controllerChegaNotificacao
                                                .notificacao
                                                .avisosStatus[index]
                                                .medicamento
                                                .id
                                                .toString()),
                                      ),
                                    );
                                  })),
                        ),
                        botoes()
                      ],
                    ),
                  ),
            botao5minutos(),
            transIconContainer(),
          ],
        );
      }),
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
              BottonsSheets.pullarBottomSheet(context, true);
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
                    'PULAR\nTODOS',
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
              if (controllerChegaNotificacao
                      .notificacao.avisosStatus[0].statusAvisoEnum ==
                  StatusAvisoEnum.atrasado) {
              } else {
                controllerChegaNotificacao.tomarTodos(DateTime.now());
              }
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
                    'TOMAR\nTODOS',
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
              BottonsSheets.adiarBottomSheet(context, true);
            },
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Icon(
                      Icons.watch_later,
                      color: iconsText,
                      size: iconSize,
                    ),
                  ),
                  Text(
                    'ADIAR\nTODOS',
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

  Widget botao5minutos() {
    return InkWell(
      onTap: () {
        final now = DateTime.now();
        controllerChegaNotificacao.adiarTodos(now.add(Duration(minutes: 5)));
      },
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

  Widget transIconContainer() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.02,
      //  color: Colors.red,
      child: Icon(
        FontAwesomeIcons.transgenderAlt,
        size: 40,
        color: container,
      ),
    );
  }

  double tamanhoContainer(int tamanho) {
    if (tamanho > 4) {
      return 500;
    } else {
      return tamanho * 65.0 + 250;
    }
  }

  String montarDataHora() {
    return controllerChegaNotificacao.notificacao.dia.hour.toString() +
        ':' +
        controllerChegaNotificacao.notificacao.dia.minute.toString();
    //return controllerTomaMedicamento.avisoStatus.dia.toString();
  }

  // String getHourFromDateString() {}
}
