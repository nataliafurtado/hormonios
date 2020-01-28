import 'package:Projeto02/app/models/avisos.dart';

class Medicamento {
  int id;
  bool ativo;
  String nome;
  List<Aviso> avisos;
  String dataInicio;
  String dataFim;
  String icone;
  String diasDasemana;
  int intervaloDeDias;
  String dosagem;
  String observacoes;
  int estoque;
  int reabastecimentoDias;
  String horaReabasteciemnto;
  String frequencia;

  Medicamento(
      {this.id,
      this.ativo,
      this.nome,
      this.avisos,
      this.dataInicio,
      this.dataFim,
      this.icone,
      this.diasDasemana,
      this.intervaloDeDias,
      this.dosagem,
      this.observacoes,
      this.estoque,
      this.reabastecimentoDias,
      this.horaReabasteciemnto,
      this.frequencia});

  Medicamento.fromMap(Map map) {
    id = map['id'];
    nome = map['nome'];
    ativo = map['ativo'];
    dataInicio = map['dataInicio'];
    dataFim = map['dataFim'];
    icone = map['icone'];
    diasDasemana = map['diasDasemana'];
    intervaloDeDias = map['intervaloDeDias'];
    dosagem = map['dosagem'];
    observacoes = map['observacoes'];
    estoque = map['estoque'];
    reabastecimentoDias = map['reabastecimentoDias'];
    horaReabasteciemnto = map['horaReabasteciemnto'];
    frequencia = map['frequencia'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'ativo': ativo,
      'nome': nome,
      //  avisos: avisos,
      'dataInicio': dataInicio,
      'dataFim': dataFim,
      'icone': icone,
      'diasDasemana': diasDasemana,
      'intervaloDeDias': intervaloDeDias,
      'dosagem': dosagem,
      'observacoes': observacoes,
      'estoque': estoque,
      'reabastecimentoDias': reabastecimentoDias,
      'horaReabasteciemnto': horaReabasteciemnto,
      'frequencia': frequencia,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }

    // for (var i = 0; i < avisos.length; i++) {
    //     Map<String, dynamic> camada = {
    //       'nome': camadasDaPiramide[i].nome,
    //       // 'total':camadasDaPiramide[i].total
    //     };
    //     if (avisos[i].total == null) {
    //       camada['total'] = 0;
    //     } else {
    //       camada['total'] = avisos[i].total;
    //     }
    //     map.addAll({'camada$i': camada});
    //   }

    return map;
  }

  @override
  String toString() {
    return "Medicamentos(id: $id, name: $nome)   $ativo $icone $dosagem $estoque ";
  }
}
