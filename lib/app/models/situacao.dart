class Situacao {
  bool confirmado;
  String remedio;
  String hora;
  String dia;
  String horaReagendado;
  String motivoPulou;

  Situacao({
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
