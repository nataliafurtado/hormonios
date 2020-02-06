class DiasDaSemana {
  int id;
  String diasDaSemana;

  DiasDaSemana({
    this.id,
    this.diasDaSemana,
  });

  DiasDaSemana.fromMap(Map map) {
    id = map['id'];
    diasDaSemana = map['diasDaSemana'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'diasDaSemana': diasDaSemana,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
