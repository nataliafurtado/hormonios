import 'package:Projeto02/app/enums/statusNotificacoesEnum.dart';
import 'package:Projeto02/app/models/avisos_status.dart';

class Notificacao {
  int id;
  List<AvisoStatus> avisosStatus;
  StatusNotificacoesEnum statusNotificacaoEnum;
  DateTime dia;

  Notificacao({
    this.id,
    this.avisosStatus,
    this.statusNotificacaoEnum,
    this.dia,
  });
  //  {
  //   avisosStatus = [];
  // }

  Notificacao.fromMap(Map map) {
    id = map['id'];
    avisosStatus = [];
    dia = map['dia'] == null ? null : DateTime.parse(map['dia']);
    statusNotificacaoEnum = StatusNotificacoesEnumConverter()
        .enumConverter(map['statusNotificacaoEnum']);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'dia': dia == null ? null : dia.toIso8601String(),
      'statusNotificacaoEnum': statusNotificacaoEnum.toString(),
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  @override
  String toString() {
    return "NOTIFICAÇÂO(id: $id - dia: $dia -${statusNotificacaoEnum.toString()}";
  }
}
