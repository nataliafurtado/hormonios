import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/bundle.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:mobx/mobx.dart';

part 'calendario_controller.g.dart';

class CalendarioController = _CalendarioBase with _$CalendarioController;
DBHelper _db = DBHelper();
//SingletonBundle bundle = SingletonBundle();

abstract class _CalendarioBase with Store {
  @observable
  List<Medicamento> medicamentosLista = [];
  @observable
  CalendarioSemana calendarioSemana = CalendarioSemana();

  @action
  Future<void> carregarCalendario() async {
    calendarioSemana = CalendarioSemana();
    await getMedicamentos();

    // PEGA SEGUNDA DESSA SEMANA
    var aux = DateTime.now();
    DateTime hoje = new DateTime(aux.year, aux.month, aux.day);
    DateTime segundaDessaSEmana =
        hoje.subtract(Duration(days: hoje.weekday - 1));

    // FOR LISTA DE MEDICAMENTOS
    for (var i1 = 0; i1 < medicamentosLista.length; i1++) {
      // PEGA DATAS INICIO O FIM DA MEDICAÇÃO
      DateTime dataInicio = medicamentosLista[i1].dataInicio;
      dataInicio =
          new DateTime(dataInicio.year, dataInicio.month, dataInicio.day);
      DateTime dataFim;
      if (medicamentosLista[i1].dataFim != null) {
        dataFim = medicamentosLista[i1].dataFim;
      }
      if ((hoje.isAfter(dataInicio) || hoje.isAtSameMomentAs(dataInicio)) &&
          (dataFim == null || hoje.isBefore(dataFim))) {
        // INICIAR MAPS
        if (calendarioSemana.medAvisoMap[medicamentosLista[i1]] == null) {
          calendarioSemana.medAvisoMap[medicamentosLista[i1]] = [];
        }

        calendarioSemana = await medicamentosLista[i1]
            .calendarioSemanaClass
            .carregaCalendarioSemana(
                segundaDessaSEmana, medicamentosLista[i1], calendarioSemana);
      }
      //     }
      //   }
      // }
    }
  }

  @action
  Future getMedicamentos() async {
    medicamentosLista = await _db.getAllMedicamentos();
    // log('www');
    // log(medicamentosLista.length.toString());
    // print(medicamentosLista.length.toString() + '    tamanho ');
    // for (var i = 0; i < medicamentosLista.length; i++) {
    //   print(medicamentosLista[i].icone);
    // }
  }
}

// if (medicamentosLista[i1].frequencia == bundle.frequencia[0]) {
// //  for dias da semana
// //
// //
// for (var i2 = 0; i2 < 7; i2++) {
//   DateTime dia = segundaDessaSEmana.add(Duration(days: i2));

//   List<Aviso> avisosDesseMed =
//       await _db.getAvisos(medicamentosLista[i1].id);
//   //
//   //for avisos
//   //
//   List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
//   for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
//     //  List<dynamic> suporte01 = [];
//     //   suporte01.addAll(avisosEvento);
//     avisosEvento.add('Tomar ' +
//         medicamentosLista[i1].nome +
//         ' ás ' +
//         avisosDesseMed[i3].hora +
//         ' QTD: ' +
//         avisosDesseMed[i3].qtd.toString());
//   }
//   // map.putIfAbsent(dia, () => avisosEvento);
// }
// // if dias especificaos da semana
// //
//
//  }
//

//    else if (medicamentosLista[i1].frequencia == bundle.frequencia[1]) {
// List list2 = jsonDecode(medicamentosLista[i1].diasDasemana);
// for (var i2 = 0; i2 < list2.length; i2++) {
//   DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
//   if (list2[i2]) {
//     List<Aviso> avisosDesseMed =
//         await _db.getAvisos(medicamentosLista[i1].id);
//     //
//     //for avisos
//     //
//     // print(i2.toString() + ' iiiii2222');
//     // print(map);
//     print('sssssss');

//     print(i2.toString() + map[dia].toString());
//     List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
//     for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
//       //  List<dynamic> suporte01 = [];
//       //   suporte01.addAll(avisosEvento);
//       avisosEvento.add('Tomar ' +
//           medicamentosLista[i1].nome +
//           ' ás ' +
//           avisosDesseMed[i3].hora +
//           ' QTD: ' +
//           avisosDesseMed[i3].qtd.toString());
//     }

//     // if (map.containsKey(dia)) {
//     //   List l = map[dia];
//     //   l.addAll(avisosEvento);
//     //   map.update(dia, (dynamic val) => val);
//     // }
//     map.putIfAbsent(dia, () => avisosEvento);
//   }
// }
//    } else if (medicamentosLista[i1].frequencia == bundle.frequencia[2]) {
//   // ou pega dfo ultimo ou com base data de inicio
//  // List list2 = jsonDecode(medicamentosLista[i1].diasDasemana);
//   for (var i2 = 0; i2 < list2.length; i2++) {
//     DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
//     if (list2[i2]) {
//       List<Aviso> avisosDesseMed =
//           await _db.getAvisos(medicamentosLista[i1].id);
//       //
//       //for avisos
//       //
//       // print(i2.toString() + ' iiiii2222');
//       // print(map);
//       // print('sssssss');

//       print(i2.toString() + map[dia].toString());
//       List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
//       for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
//         //  List<dynamic> suporte01 = [];
//         //   suporte01.addAll(avisosEvento);
//         avisosEvento.add('Tomar ' +
//             medicamentosLista[i1].nome +
//             ' ás ' +
//             avisosDesseMed[i3].hora +
//             ' QTD: ' +
//             avisosDesseMed[i3].qtd.toString());
//    }

// if (map.containsKey(dia)) {
//   List l = map[dia];
//   l.addAll(avisosEvento);
//   map.update(dia, (dynamic val) => val);
// }
//  map.putIfAbsent(dia, () => avisosEvento);
