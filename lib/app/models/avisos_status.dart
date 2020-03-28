import 'package:Projeto02/app/enums/statusAvisoEnum.dart';

class AvisoStatus {
  int id;
  int medicamentoId;
  String hora;
  int qtd;
  //
  DateTime dia;
  StatusAvisoEnum statusAvisoEnum;

  AvisoStatus({this.id, this.hora, this.qtd, this.dia, this.statusAvisoEnum});

  AvisoStatus.fromMap(Map map) {
    id = map['id'];
    hora = map['hora'];
    qtd = map['qtd'];
    medicamentoId = map['medicamentoId'];
    dia = map['dia'];
    statusAvisoEnum =
        StatusAvisoEnumConverter().enumConverter(map['statusAvisoEnum']);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'hora': hora,
      'qtd': qtd,
      'medicamentoId': medicamentoId,
      'dia': dia,
      'statusAvisoEnum': statusAvisoEnum.toString(),
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
