class Lembrete {
  bool confirmado;
  String remedio;
  String hora;
  DateTime dia;
  String horaReagendado;
  String motivoPulou;

  Lembrete({
    this.confirmado,
    this.remedio,
    this.hora,
    this.dia,
    this.motivoPulou,
    this.horaReagendado,
  });
}

class Horario {
  String hora;
  int quantidade;

  Horario({this.hora, this.quantidade});
}
