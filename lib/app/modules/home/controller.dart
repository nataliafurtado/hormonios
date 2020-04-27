// import 'dart:developer';

// import 'package:mobx/mobx.dart';
// part 'controller.g.dart';

// enum Pages { calendario, hormonios }
// class Controller = ControllerBase with _$Controller;

// abstract class ControllerBase with Store {
//   @observable
//   int counter = 0;

//   @action
//   increment() {
//     counter++;
//     counter++;
//     counter++;
//     log(counter.toString());
//   }

//   @observable
//   Pages mostrarPagina = Pages.calendario;

//   @action
//   void mudarPaginaHormonios() {
//     mostrarPagina = Pages.hormonios;
//   }

//   @action
//   void mudarPaginaCalendarios() {
//     mostrarPagina = Pages.calendario;
//   }

//   @observable
//   String text = '';

//   @action
//   mudarTexto(String textNovo) {
//     text = textNovo;
//   }
// }
