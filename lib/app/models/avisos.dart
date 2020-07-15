import 'package:Projeto02/app/enums/statusAvisoEnum.dart';

class Aviso {
  int id;
  int medicamentoId;
  int hora;
  int minuto;
  int qtd;
  //
  // DateTime dia;
  // StatusAvisoEnum statusAvisoEnum;

  Aviso({
    this.id,
    this.hora,
    this.minuto,
    this.qtd,
    // this.dia,
  });

  Aviso.fromMap(Map map) {
    id = map['id'];
    hora = map['hora'] ?? "";
    minuto = map['minuto'] ?? "";
    qtd = map['qtd'] ?? "";
    medicamentoId = map['medicamentoId'];
    // dia = map['dia'];
    // statusAvisoEnum =
    //     StatusAvisoEnumConverter().enumConverter(map['statusAvisoEnum']);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'hora': hora,
      'qtd': qtd,
      'minuto': minuto,
      'medicamentoId': medicamentoId,
      // 'dia': dia,
      // 'statusAvisoEnum': statusAvisoEnum.toString(),
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  @override
  String toString() {
    return "AVISO(id: $id-$hora-$minuto-$medicamentoId";
  }
}
