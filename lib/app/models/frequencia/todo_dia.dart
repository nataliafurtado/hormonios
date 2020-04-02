import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/calendario_semana.dart';

import 'package:Projeto02/app/models/medicamento.dart';

class TodoDia implements CalendarioSemanaClass {
  int id;
  // int tempoToma;

  // int intevalo;

  TodoDia({
    this.id,
    // this.tempoToma,
    // this.intevalo,
  });

  TodoDia.fromMap(Map map) {
    id = map['id'];
    // tempoToma = map['tempoToma'];
    // intevalo = map['intevalo'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      // 'intevalo': intevalo,
      // 'tempoToma': tempoToma,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  @override
  Future<CalendarioSemana> carregaCalendarioSemana(
    DateTime segundaDessaSEmana,
    Medicamento medicamento,
    CalendarioSemana calendarioSemana,
  ) async {
    DBHelper _db = DBHelper();
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
        AvisoStatus avi;

        avi = AvisoStatus(
          aviso: avisosDesseMed[i3],
          dia: dia,
          statusAvisoEnum: StatusAvisoEnum.antesDeAvisar,
        );

        // if (i3 == 1) {
        //   avi = AvisoStatus(
        //     aviso: avisosDesseMed[i3],
        //     dia: dia,
        //     statusAvisoEnum: StatusAvisoEnum.atrasado,
        //   );
        // } else if (i3 == 2) {
        //   avi = AvisoStatus(
        //     aviso: avisosDesseMed[i3],
        //     dia: dia,
        //     statusAvisoEnum: StatusAvisoEnum.ingerido,
        //   );
        // } else {
        //   avi = AvisoStatus(
        //     aviso: avisosDesseMed[i3],
        //     dia: dia,
        //     statusAvisoEnum: StatusAvisoEnum.antesDeAvisar,
        //   );
        // }

        // fazer for checar se tem esse dia e subtituis se necessári

        calendarioSemana.medAvisoMap[medicamento].add(avi);
      }
      //

      // CHECAR SE INICIADO OS MAPS E ADD
      if (calendarioSemana.diaIdMap[dia] == null) {
        calendarioSemana.diaIdMap[dia] = [];
      }
      calendarioSemana.diaIdMap[dia].add(medicamento.id);

      // avisos por dia desse medicamento

      // if (map.containsKey(dia)) {
      //   //???????????????????????????????????????????
      //   //   map[dia].add('i2');
      // } else {
      //   map.putIfAbsent(dia, () => iDAvisosDoDiaDesseMedicamento);
      // }

      // ADD NESSE DIA // VER SE ... VER SE TEM DIA SE TIVER ADD SE NAO CRIA

    }

    return calendarioSemana;
    // throw UnimplementedError();
  }
}

// List<dynamic> listaMedicamentosIdsDoDia =
//   calendarioSemana.diaIdMap[dia] != null
//       ? calendarioSemana.diaIdMap[dia]
//       : [];
//
