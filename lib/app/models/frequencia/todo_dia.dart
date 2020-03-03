import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';

class TodoDia implements FrequenciaClass {
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
  Future<Map<DateTime, List>> mapeia(DateTime segundaDessaSEmana,
      Medicamento medicamento, Map<DateTime, List> map) async {
    //  for dias da semana
    //
    //
    Map<DateTime, List> map = {};

    DBHelper _db = DBHelper();
    for (var i2 = 0; i2 < 7; i2++) {
      DateTime dia = segundaDessaSEmana.add(Duration(days: i2));

      List<Aviso> avisosDesseMed = await _db.getAvisos(medicamento.id);
      //
      //for avisos
      //
      List<dynamic> avisosEvento = map[dia] != null ? map[dia] : [];
      for (var i3 = 0; i3 < avisosDesseMed.length; i3++) {
        //  List<dynamic> suporte01 = [];
        //   suporte01.addAll(avisosEvento);
        avisosEvento.add('Tomar ' +
            medicamento.nome +
            ' ás ' +
            avisosDesseMed[i3].hora +
            ' QTD: ' +
            avisosDesseMed[i3].qtd.toString());
      }
      map.putIfAbsent(dia, () => avisosEvento);
    }
    // if dias especificaos da semana
    //
    // TODO: implement mapeia
    return map;
    // throw UnimplementedError();
  }
}
