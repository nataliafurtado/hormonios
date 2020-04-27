// import 'dart:developer';

// import 'package:Projeto02/app/helpers/botton_sheet.dart';
// import 'package:Projeto02/app/helpers/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'cheganotificacao_controller.dart';

// class CheganotificacaoPage extends StatefulWidget {
//   final String title;
//   final String id;
//   const CheganotificacaoPage(
//       {Key key, this.title = "Cheganotificacao", this.id})
//       : super(key: key);

//   @override
//   _CheganotificacaoPageState createState() => _CheganotificacaoPageState();
// }

// class _CheganotificacaoPageState
//     extends ModularState<CheganotificacaoPage, CheganotificacaoController> {
//   final controllerChegaNotificacao = Modular.get<CheganotificacaoController>();
//   @override
//   void initState() {
//     controllerChegaNotificacao.carregaNotificacao(widget.id);
//     super.initState();
//   }

//   Color iconsText = blueTrans.shade900;
//   double iconSize = 35;
//   Color container = Colors.white;
//   double fontSize = 14;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       backgroundColor: blueTrans,
//       body: Observer(builder: (_) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             // Container(
//             //   height: MediaQuery.of(context).size.height * 0.3,
//             //   //  color: Colors.blue.shade50,
//             //   child: Column(
//             //     children: <Widget>[
//             //       Container(
//             //         margin: const EdgeInsets.only(top: 60.0),
//             //         // height: 100,
//             //         child: Text(
//             //           'Título reportagem trans',
//             //           style: TextStyle(
//             //             fontSize: 20,
//             //             // fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //       Container(
//             //         padding: EdgeInsets.all(20),
//             //         child: Text(
//             //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
//             //           overflow: TextOverflow.ellipsis,
//             //           maxLines: 4,
//             //         ),
//             //       ),
//             //       Container(
//             //         child: Text(
//             //           'www.link.com.br',
//             //           style: TextStyle(
//             //             color: Colors.blue,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             transIconContainer(),
//             controllerChegaNotificacao.notificacao == null
//                 ? Container(
//                     height: MediaQuery.of(context).size.height * 0.6,
//                     child: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   )
//                 : Container(
//                     padding: EdgeInsets.all(15),
//                     height: tamanhoContainer(controllerChegaNotificacao
//                         .notificacao.avisosStatus.length),
//                     decoration: BoxDecoration(
//                         //   color: Colors.amber,
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                   topRight: Radius.circular(20))),
//                           child: Center(
//                             child: Text(
//                               controllerChegaNotificacao.notificacao.dia.hour
//                                       .toString() +
//                                   ':' +
//                                   controllerChegaNotificacao
//                                       .notificacao.dia.minute
//                                       .toString(),
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                               //  color: Color(0xffffb5cb),
//                               color: Colors.white,
//                               child: ListView.builder(
//                                   itemCount: controllerChegaNotificacao
//                                       .notificacao.avisosStatus.length,
//                                   itemBuilder: (ctx, index) {
//                                     return Card(
//                                       child: ListTile(
//                                         onTap: () {
//                                           Modular.to
//                                               .pushNamed('/tomarmedicacao/2');
//                                         },
//                                         leading: Icon(IconData(
//                                             controllerChegaNotificacao
//                                                 .notificacao
//                                                 .avisosStatus[index]
//                                                 .medicamento
//                                                 .icone,
//                                             fontPackage: 'font_awesome_flutter',
//                                             fontFamily: 'FontAwesomeSolid')),
//                                         title: Text(controllerChegaNotificacao
//                                             .notificacao
//                                             .avisosStatus[index]
//                                             .medicamento
//                                             .nome),
//                                         subtitle: Text(
//                                             controllerChegaNotificacao
//                                                 .notificacao
//                                                 .avisosStatus[index]
//                                                 .medicamento
//                                                 .id
//                                                 .toString()),
//                                       ),
//                                     );
//                                   })),
//                         ),
//                         botoes()
//                       ],
//                     ),
//                   ),
//             transIconContainer(),
//           ],
//         );
//       }),
//     );
//   }

//   Widget botoes() {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//           color: container,
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(15))),
//       child:
//           // Padding(
//           //  padding: const EdgeInsets.all(5.0),
//           //  child:
//           Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           InkWell(
//             onTap: () {
//               // BottonsSheets.tomarBottomSheet(context, montarDataHora(),
//               //     controllerChegaNotificacao.notificacao.dia);
//             },
//             child: Container(
//               height: 90,
//               width: MediaQuery.of(context).size.width * 0.25,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Icon(
//                     Icons.cancel,
//                     color: iconsText,
//                     size: iconSize,
//                   ),
//                   Text(
//                     'PULAR\nTODOS',
//                     maxLines: 2,
//                     style: TextStyle(
//                       color: iconsText,
//                       fontSize: fontSize,
//                       letterSpacing: 2,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 90,
//             width: MediaQuery.of(context).size.width * 0.25,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Icon(
//                   Icons.check_circle,
//                   color: iconsText,
//                   size: iconSize,
//                 ),
//                 Text(
//                   'TOMAR\nTODOS',
//                   style: TextStyle(
//                     color: iconsText,
//                     fontSize: fontSize,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width * 0.25,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Icon(
//                     Icons.watch_later,
//                     color: iconsText,
//                     size: iconSize,
//                   ),
//                 ),
//                 Text(
//                   'ADIAR',
//                   style: TextStyle(
//                     color: iconsText,
//                     fontSize: fontSize,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       //  ),
//     );
//   }

//   Widget transIconContainer() {
//     return Container(
//       // height: MediaQuery.of(context).size.height * 0.02,
//       //  color: Colors.red,
//       child: Icon(
//         FontAwesomeIcons.transgenderAlt,
//         size: 40,
//         color: container,
//       ),
//     );
//   }

//   double tamanhoContainer(int tamanho) {
//     if (tamanho > 4) {
//       return 500;
//     } else {
//       return tamanho * 65.0 + 250;
//     }
//   }

//   String montarDataHora() {
//     return controllerChegaNotificacao.notificacao.dia.hour.toString() +
//         ':' +
//         controllerChegaNotificacao.notificacao.dia.minute.toString();
//     //return controllerTomaMedicamento.avisoStatus.dia.toString();
//   }

//   // String getHourFromDateString() {}
// }
