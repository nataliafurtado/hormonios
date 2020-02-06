class Ciclo {
  int id;
  int tempoToma;

  int intevalo;

  Ciclo({
    this.id,
    this.tempoToma,
    this.intevalo,
  });

  Ciclo.fromMap(Map map) {
    id = map['id'];
    tempoToma = map['tempoToma'];
    intevalo = map['intevalo'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'intevalo': intevalo,
      'tempoToma': tempoToma,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
