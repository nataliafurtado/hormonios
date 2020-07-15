import 'dart:convert';
import 'dart:developer';

import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';
import 'package:Projeto02/app/models/medicamento.dart';

class DiasDaSemana implements Frequencia {
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

  List<int> diasDaSemanaIntList(Medicamento med) {
    List list2 = jsonDecode(med.diasDasemana);
    List<int> diasDaSemana = [];
    log('fffffffffff ' + list2.length.toString());
    for (var i = 0; i < list2.length; i++) {
      log('dia da semana ' + i.toString());
      if (list2[i] == true) {
        diasDaSemana.add(i + 1);
      }
    }
    return diasDaSemana;
  }

  DBHelper _db = DBHelper();
  @override
  Future<List<AvisoStatus>> carregaAvisoStatus(
    Aviso aviso,
    DateTime lastMidnight,
    Medicamento med,
  ) async {
    List<AvisoStatus> listAvisoStatus = [];
    //LOGICA CRIA FREQUENCIA

    List<int> diasDaSemana = diasDaSemanaIntList(med);

    // var aux = DateTime.now();
    // DateTime hoje = new DateTime(aux.year, aux.month, aux.day);
    // DateTime segundaDessaSEmana =
    //     hoje.subtract(Duration(days: hoje.weekday - 1));
    for (var i2 = 0; i2 < 30; i2++) {
      DateTime diaEhora = new DateTime(
        lastMidnight.year,
        lastMidnight.month,
        lastMidnight.day,
        aviso.hora,
        aviso.minuto,
      ).add(Duration(days: i2));

      if (diasDaSemana.contains(diaEhora.weekday)) {
        // await _db.deleteAvisosStatus(aviso.id, diaEhora);
        // SE TIVER PEGA AVISOsTATUS
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
  Future<CalendarioSemana> carregaCalendarioSemana(DateTime segundaDessaSEmana,
      Medicamento medicamento, CalendarioSemana calendarioSemana) async {
    List<int> diasDaSemana = diasDaSemanaIntList(medicamento);
    List<Aviso> avisosDesseMed = await _db.getAvisos(medicamento.id);
    final now = DateTime.now();

    // SEMANA COMEÇANDO NA SEGUNDA
    for (var i2 = 0; i2 < 7; i2++) {
      DateTime dia = segundaDessaSEmana.add(Duration(days: i2));

      //  AVISOS DESSE MEDICAMENTO
      // List<AvisoStatus> avisosStatusDesseMed = [];
      // FAZER AVISOS DESSE MED DESSE POR  DIA
      //PEGAR
      //ARRUMAR NO FOR ABAIXO
      if (diasDaSemana.contains(dia.weekday)) {
        bool addDia = false;
        for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
          // AvisoStatus avi = AvisoStatus(
          //   aviso: avisosDesseMed[i3],
          //   dia: dia,
          //   statusAvisoEnum: StatusAvisoEnum.antesDeAvisar,
          // );
          DateTime diaMontado = DateTime(
            dia.year,
            dia.month,
            dia.day,
            avisosDesseMed[i3].hora,
            avisosDesseMed[i3].minuto,
          );
          AvisoStatus avi =
              await _db.getAvisosStatus(avisosDesseMed[i3].id, diaMontado);
          if (avi != null) {
            calendarioSemana.medAvisoMap[medicamento].add(avi);
          } else if (dia.isAfter(now)) {
            avi = AvisoStatus(
                aviso: avisosDesseMed[i3],
                dia: diaMontado,
                medicamento: medicamento,
                statusAvisoEnum: StatusAvisoEnum.antesDeAvisar);
            calendarioSemana.medAvisoMap[medicamento].add(avi);
          }
          addDia = true;
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
