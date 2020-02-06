class TodoDia {
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
}
