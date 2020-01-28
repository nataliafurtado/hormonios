class Aviso {
  int id;
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
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'hora': hora,
      'qtd': qtd,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
