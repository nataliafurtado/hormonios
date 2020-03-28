import 'dart:convert';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';
import 'package:Projeto02/app/models/medicamento.dart';

class DiasDaSemana implements CalendarioSemanaClass {
  int id;
  String diasDaSemana;

  DiasDaSemana({
    this.id,
    this.diasDaSemana,
  });

  DiasDaSemana.fromMap(Map map) {
    id = map['id'];
    diasDaSemana = map['diasDaSemana'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'diasDaSemana': diasDaSemana,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  @override
  Future<CalendarioSemana> carregaCalendarioSemana(DateTime segundaDessaSEmana,
      Medicamento medicamento, CalendarioSemana alendarioSemana) async {
    List list2 = jsonDecode(medicamento.diasDasemana);
    DBHelper _db = DBHelper();
    // Map<DateTime, List> map = {};
    //   for (var i2 = 0; i2 < list2.length; i2++) {
    //     DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
    //     if (list2[i2]) {
    //       List<Aviso> avisosDesseMed = await _db.getAvisos(medicamento.id);
    //       //
    //       //for avisos
    //       //
    //       // print(i2.toString() + ' iiiii2222');
    //       // print(map);
    //       print('sssssss');

    //       List<dynamic> avisosEvento = [];
    //       for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
    //         //  List<dynamic> suporte01 = [];
    //         //   suporte01.addAll(avisosEvento);
    //         avisosEvento.add('Tomar ' +
    //             medicamento.nome +
    //             ' ás ' +
    //             avisosDesseMed[i3].hora +
    //             ' QTD: ' +
    //             avisosDesseMed[ialendarioSemanaa)) {
    //         map[dia].add(avisosEvento);
    //       } else {
    //         map.putIfAbsent(dia, () => avisosEvento);
    //       }
    //     }
    //   }
    return alendarioSemana;
  }
}
