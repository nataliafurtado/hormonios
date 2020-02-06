class IntervaloDeDias {
  int id;
  int intervaloDeDias;

  IntervaloDeDias({
    this.id,
    this.intervaloDeDias,
  });

  IntervaloDeDias.fromMap(Map map) {
    id = map['id'];
    intervaloDeDias = map['intervaloDeDias'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'intervaloDeDias': intervaloDeDias,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }
}
