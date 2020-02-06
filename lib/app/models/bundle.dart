class SingletonBundle {
  SingletonBundle._privateConstructor();
  List<String> frequencia = [
    'TODOS OS DIAS',
    'DIAS ESPECÍFICOS DA SEMANA',
    'INTERVALO DE DIAS',
    'CICLO RECORRENTE'
  ];

  List<String> diaSemanaCurto = [
    'SEG',
    'TER',
    'QUA',
    'QUI',
    'SEX',
    'SAB',
    'DOM',
  ];
  static final SingletonBundle _instance =
      SingletonBundle._privateConstructor();

  factory SingletonBundle() {
    return _instance;
  }
}
