import 'dart:developer';

import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';

class IntervaloDeDias implements Frequencia {
  int id;
  int intervaloDeDias;

  IntervaloDeDias({
    this.id,
    this.intervaloDeDias,
  });

  IntervaloDeDias.fromMap(Map map) {
    id = map['id'];
    intervaloDeDias = map['intervaloDeDias'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'intervaloDeDias': intervaloDeDias,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  List<int> diasDaSemanaIntListIntervaloDias(Medicamento med) {
    List<int> list3 = [];
    int intervalo = med.intervaloDeDias;
    int numMaxDias = 0;
    var i1 = 0;
    while (numMaxDias <= 30) {
      numMaxDias = i1 * intervalo;
      list3.add(numMaxDias);
      i1++;
    }
    return list3;
  }

  DBHelper _db = DBHelper();

  @override
  Future<List<AvisoStatus>> carregaAvisoStatus(
    Aviso aviso,
    DateTime lastMidnight,
    Medicamento med,
  ) async {
    List<AvisoStatus> listAvisoStatus = [];

    // VER ÚLTIMO DIA Q TEVE AVISO
    // se tem ultimo começa no ultimo senão começa hj

    AvisoStatus ultimoavisoStatus = await _db.getUltimoAvisoStatus(med);

    DateTime dataComecarLogicaDoIntervalo;
    if (ultimoavisoStatus != null) {
      dataComecarLogicaDoIntervalo = ultimoavisoStatus.dia;
    } else {
      dataComecarLogicaDoIntervalo = lastMidnight;
    }

    //LOGICA CRIA FREQUENCIA
    List<int> list3 = diasDaSemanaIntListIntervaloDias(med);

    for (var i2 = 0; i2 < 30; i2++) {
      DateTime diaEhora = new DateTime(
        dataComecarLogicaDoIntervalo.year,
        dataComecarLogicaDoIntervalo.month,
        dataComecarLogicaDoIntervalo.day,
        aviso.hora,
        aviso.minuto,
      ).add(Duration(days: i2));

      // await _db.deleteAvisosStatus(aviso.id, diaEhora);
      // SE TIVER PEGA AVISOsTATUS
      if (list3.contains(i2)) {
        AvisoStatus avisoStatus = await _db.getAvisosStatus(aviso.id, diaEhora);
        // SE NÃO TIVER CRIA
        if (avisoStatus == null) {
          log('CRIADO NOVO AVISOSTATUS DO MED  ${med.nome}');
          avisoStatus = AvisoStatus(
              aviso: aviso,
              dia: diaEhora,
              medicamento: med,
              statusAvisoEnum: StatusAvisoEnum.antesDeAvisar);
          avisoStatus.id = await _db.saveAvisoStatus(avisoStatus);
        }
        log('JÁ EXISTE  AVISOSTATUS DO MED  ${med.nome}');
        listAvisoStatus.add(avisoStatus);
      }
    }

    return listAvisoStatus;
  }

  @override
  @override
  Future<CalendarioSemana> carregaCalendarioSemana(
    DateTime segundaDessaSEmana,
    Medicamento medicamento,
    CalendarioSemana calendarioSemana,
  ) async {
    List<int> list3 = diasDaSemanaIntListIntervaloDias(medicamento);
    List<Aviso> avisosDesseMed = await _db.getAvisos(medicamento.id);
    // SEMANA COMEÇANDO NA SEGUNDA
    for (var i2 = 0; i2 < 7; i2++) {
      DateTime dia = segundaDessaSEmana.add(Duration(days: i2));

      //  AVISOS DESSE MEDICAMENTO
      // List<AvisoStatus> avisosStatusDesseMed = [];
      // FAZER AVISOS DESSE MED DESSE POR  DIA
      //PEGAR
      //ARRUMAR NO FOR ABAIXO
      if (list3.contains(dia.weekday)) {
        bool addDia = false;
        for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
          // AvisoStatus avi = AvisoStatus(
          //   aviso: avisosDesseMed[i3],
          //   dia: dia,
          //   statusAvisoEnum: StatusAvisoEnum.antesDeAvisar,
          // );
          AvisoStatus avi = await _db.getAvisosStatus(
              avisosDesseMed[i3].id,
              DateTime(
                dia.year,
                dia.month,
                dia.day,
                avisosDesseMed[i3].hora,
                avisosDesseMed[i3].minuto,
              ));
          if (avi != null) {
            calendarioSemana.medAvisoMap[medicamento].add(avi);
            addDia = true;
          }
        }
        //

        // CHECAR SE INICIADO OS MAPS E ADD
        if (calendarioSemana.diaIdMap[dia] == null) {
          calendarioSemana.diaIdMap[dia] = [];
        }
        if (addDia) {
          calendarioSemana.diaIdMap[dia].add(medicamento.id);
        }
      }
    }
    return calendarioSemana;
  }
}
