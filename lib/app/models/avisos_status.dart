import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/enums/tomarMedicamentoEnum.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';

class AvisoStatus {
  int avisoId;
  int notId;
  Medicamento medicamento;
  Aviso aviso;
  StatusAvisoEnum statusAvisoEnum;
  int id;
  DateTime dia;
  DateTime horaIngerido;
  PularEnum pularEnum;
  int numeroAdiadas;

  AvisoStatus(
      {this.aviso, this.dia, this.statusAvisoEnum, this.id, this.medicamento});

  AvisoStatus.fromMap(Map map) {
    numeroAdiadas = map['numeroAdiadas'];
    id = map['id'];
    dia = map['dia'] == null ? null : DateTime.parse(map['dia']);
    horaIngerido = map['horaIngerido'] == null
        ? null
        : DateTime.parse(map['horaIngerido']);
    notId = map['notId'];
    avisoId = map['avisoId'];
    statusAvisoEnum =
        StatusAvisoEnumConverter().enumConverter(map['statusAvisoEnum']);
    pularEnum = PularEnumConverter().enumConverter(map['pularEnum']);
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'numeroAdiadas': numeroAdiadas,
      'avisoId': aviso.id,
      'notId': notId,
      'dia': dia == null ? null : dia.toIso8601String(),
      'horaIngerido':
          horaIngerido == null ? null : horaIngerido.toIso8601String(),
      'id': id,
      'medicamentoId': medicamento.id,
      'statusAvisoEnum': statusAvisoEnum.toString(),
      'pularEnum': pularEnum.toString(),
    };
    return map;
  }

  @override
  String toString() {
    return "AVISOSTATUS(id: $id-$dia horaingerido:-$horaIngerido-${statusAvisoEnum.toString()}" +
        " - ${pularEnum.toString()} - $numeroAdiadas -  notId: $notId , avisoID $avisoId)  ";
  }
}
