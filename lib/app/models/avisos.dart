class Aviso {
  int id;
  int medicamentoId;
  String hora;
  int qtd;

  Aviso({
    this.id,
    this.hora,
    this.qtd,
  });

  Aviso.fromMap(Map map) {
    id = map['id'];
    hora = map['hora'];
    qtd = map['qtd'];
    medicamentoId = map['medicamentoId'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'hora': hora,
      'qtd': qtd,
      'medicamentoId': medicamentoId,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
