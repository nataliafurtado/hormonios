import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/frequencia/dias_da_semana.dart';
import 'package:Projeto02/app/models/frequencia/todo_dia.dart';

class Medicamento {
  int id;
  bool ativo;
  String nome;
  List<Aviso> avisos;
  String dataInicio;
  String dataFim;
  int icone;
  String diasDasemana;
  int intervaloDeDias;
  int dosagem;
  String medida;
  String observacoes;
  int estoque;
  int quantidadeAntesAvisarReabastecimento;
  String horaReabasteciemnto;
  bool avisarReabastecimento;
  String frequencia;
  FrequenciaClass freqClass;

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
      this.medida,
      this.observacoes,
      this.estoque,
      this.quantidadeAntesAvisarReabastecimento,
      this.horaReabasteciemnto,
      this.avisarReabastecimento,
      this.frequencia,
      this.freqClass});

  Medicamento.fromMap(Map map) {
    id = map['id'];
    nome = map['nome'];

    if (map['ativo'] == 1) {
      ativo = true;
    } else {
      ativo = false;
    }

    dataInicio = map['dataInicio'];
    dataFim = map['dataFim'];
    icone = map['icone'];
    diasDasemana = map['diasDasemana'];
    intervaloDeDias = map['intervaloDeDias'];
    dosagem = map['dosagem'];
    medida = map['medida'];
    observacoes = map['observacoes'];
    estoque = map['estoque'];
    quantidadeAntesAvisarReabastecimento =
        map['quantidadeAntesAvisarReabastecimento'];
    horaReabasteciemnto = map['horaReabasteciemnto'];

    frequencia = map['frequencia'];

    avisos = [];

    if (map['avisarReabastecimento'] == 1) {
      avisarReabastecimento = true;
    } else {
      avisarReabastecimento = false;
    }

    if (map['frequencia'] == 'TODOS OS DIAS') {
      freqClass = TodoDia();
    } else if (map['frequencia'] == 'DIAS ESPECÍFICOS DA SEMANA') {
      freqClass = DiasDaSemana();
    } else if (map['frequencia'] == 2) {}
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
      'medida': medida,
      'observacoes': observacoes,
      'estoque': estoque,
      'quantidadeAntesAvisarReabastecimento':
          quantidadeAntesAvisarReabastecimento,
      'horaReabasteciemnto': horaReabasteciemnto,
      'frequencia': frequencia,
      'avisarReabastecimento': avisarReabastecimento
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

abstract class FrequenciaClass {
  Future<Map<DateTime, List>> mapeia(DateTime segundaDessaSEmana,
      Medicamento medicamento, Map<DateTime, List> map);
}
