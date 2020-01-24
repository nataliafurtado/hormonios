class Medicamento {
  bool ativo;
  String nome;
  List<Horario> horariosLista;
  String dataInicio;
  String dataFim;
  String icone;
  String dosagem;
  String observacoes;
  int estoque;
  int reabastecimento;
  String frequencia;

  Medicamento(
      {this.nome,
      this.horariosLista,
      this.ativo,
      this.dataInicio,
      this.dataFim,
      this.icone,
      this.dosagem,
      this.observacoes,
      this.estoque,
      this.reabastecimento,
      this.frequencia});
}

class Horario {
  String hora;
  int quantidade;

  Horario({this.hora, this.quantidade});
}
