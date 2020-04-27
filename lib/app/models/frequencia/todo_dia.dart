import 'dart:developer';

import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';

import 'package:Projeto02/app/models/medicamento.dart';

class TodoDia implements CalendarioSemanaClass, NotificacaoClass {
  int id;
  // int tempoToma;

  // int intevalo;

  TodoDia({
    this.id,
  });

  TodoDia.fromMap(Map map) {
    id = map['id'];
  }

  Map toMap() {
    Map<String, dynamic> map = {};
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  DBHelper _db = DBHelper();

  @override
  Future<List<AvisoStatus>> carrega30diasNotificacao(
    Aviso aviso,
    DateTime lastMidnight,
    Medicamento med,
  ) async {
    List<AvisoStatus> listAvisoStatus = [];

    for (var i2 = 0; i2 < 30; i2++) {
      DateTime diaEhora = new DateTime(
        lastMidnight.year,
        lastMidnight.month,
        lastMidnight.day,
        aviso.hora,
        aviso.minuto,
      ).add(Duration(days: i2));

      // await _db.deleteAvisosStatus(aviso.id, diaEhora);

      AvisoStatus avisoStatus = await _db.getAvisosStatus(aviso.id, diaEhora);
      if (avisoStatus == null) {
        log('cria nova aviso status ');
        avisoStatus = AvisoStatus(
            aviso: aviso,
            dia: diaEhora,
            medicamento: med,
            statusAvisoEnum: StatusAvisoEnum.antesDeAvisar);
        avisoStatus.id = await _db.saveAvisoStatus(avisoStatus);
      }
      // log('add avis status ja exixtente ');
      listAvisoStatus.add(avisoStatus);
    }

    return listAvisoStatus;
  }

  @override
  Future<CalendarioSemana> carregaCalendarioSemana(
    DateTime segundaDessaSEmana,
    Medicamento medicamento,
    CalendarioSemana calendarioSemana,
  ) async {
    // SEMANA COMEÇANDO NA SEGUNDA
    for (var i2 = 0; i2 < 7; i2++) {
      DateTime dia = segundaDessaSEmana.add(Duration(days: i2));
      //  AVISOS DESSE MEDICAMENTO
      List<Aviso> avisosDesseMed = await _db.getAvisos(medicamento.id);
      List<AvisoStatus> avisosStatusDesseMed = [];
      // FAZER AVISOS DESSE MED DESSE POR  DIA
      //PEGAR
      //ARRUMAR NO FOR ABAIXO

      for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
        AvisoStatus avi = AvisoStatus(
          aviso: avisosDesseMed[i3],
          dia: dia,
          statusAvisoEnum: StatusAvisoEnum.antesDeAvisar,
        );

        calendarioSemana.medAvisoMap[medicamento].add(avi);
      }
      //

      // CHECAR SE INICIADO OS MAPS E ADD
      if (calendarioSemana.diaIdMap[dia] == null) {
        calendarioSemana.diaIdMap[dia] = [];
      }
      calendarioSemana.diaIdMap[dia].add(medicamento.id);
    }
    return calendarioSemana;
  }
}
