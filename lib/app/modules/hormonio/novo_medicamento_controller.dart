import 'dart:convert';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'novo_medicamento_controller.g.dart';

class NovoMedicamentoController = _HormonioBase
    with _$NovoMedicamentoController;

abstract class _HormonioBase with Store {
  DBHelper _db = DBHelper();

  // @observable
  // Medicamento novoMedicamentro = Medicamento(frequencia: '21');
//instruções
// dosagem
  @observable
  int quantidadeDsagem;
  @observable
  String medidaDOsagem;

// observaçoes
  @observable
  String observacaoSelecionada;
  @observable
  String observacaoEscrita;

  @computed
  String get carregaObservacoes {
    if (observacaoSelecionada != null && observacaoEscrita != null) {
      return '   $observacaoSelecionada $observacaoEscrita  ';
    } else if (observacaoSelecionada != null) {
      return '   $observacaoSelecionada';
    } else if (observacaoEscrita != null) {
      return '   $observacaoEscrita';
    } else {
      return ' APERTE PARA DEFINIR';
    }
  }

  @computed
  String get carregardosagem {
    if (quantidadeDsagem != null && medidaDOsagem != null) {
      return '   $quantidadeDsagem $medidaDOsagem  ';
    } else if (quantidadeDsagem != null) {
      return '   $quantidadeDsagem doses ';
    } else {
      return ' APERTE PARA DEFINIR';
    }
  }

  @action
  zerarDosagem() {
    quantidadeDsagem = null;
    medidaDOsagem = null;
  }

  @action
  zerarObservacao() {
    observacaoSelecionada = null;
    observacaoEscrita = null;
  }

  Future<void> salvarNovoMedcicamento(
      String nome,
      List<Aviso> avisos,
      DateTime dataInicio,
      int duracao,
      String frequenciaSelecionada,
      //melhorar
      List<bool> diasDaSemana,
      int intervaloDeDias,
      IconData iconData,
      // String dosagem,
      // String observacoes,
      int estoque,
      int quantidadeAntesAvisarReabastecimento,
      String horaAvisarReabastecimento,
      bool avisarReabastecimento) async {
    //
    String diaDasemanaString = jsonEncode(diasDaSemana);
    //List list2 = jsonDecode(json);
    DateTime dataFim;
    if (duracao != 0 && duracao != null) {
      dataFim = new DateTime(
          dataInicio.year, dataInicio.month, dataInicio.day + duracao);
    }
    String obs;
    if (observacaoSelecionada != null && observacaoEscrita != null) {
      obs = '$observacaoSelecionada  $observacaoEscrita';
    } else if (observacaoSelecionada != null) {
      obs = '$observacaoSelecionada ';
    } else if (observacaoEscrita != null) {
      obs = '$observacaoEscrita';
    }

    print(iconData.fontFamily);
    print(iconData.fontPackage);
    print(iconData.fontFamily);
    Medicamento novo = Medicamento(
        ativo: true,
        nome: nome,
        dataInicio: dataInicio,
        dataFim: dataFim != null ? dataFim : null,
        frequencia: frequenciaSelecionada,
        diasDasemana: diaDasemanaString,
        intervaloDeDias: intervaloDeDias,
        icone: iconData.codePoint,
        dosagem: quantidadeDsagem,
        medida: medidaDOsagem,
        observacoes: obs,
        estoque: estoque,
        horaReabasteciemnto: horaAvisarReabastecimento,
        quantidadeAntesAvisarReabastecimento:
            quantidadeAntesAvisarReabastecimento,
        avisarReabastecimento: avisarReabastecimento);

    int id = await _db.saveMedicamento(novo);
    await _db.saveAvisos(avisos, id);
  }
}
