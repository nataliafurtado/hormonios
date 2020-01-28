import 'dart:convert';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'hormonio_controller.g.dart';

class HormonioController = _HormonioBase with _$HormonioController;

abstract class _HormonioBase with Store {
  DBHelper _db = DBHelper();

  @observable
  Medicamento novoMedicamentro = Medicamento(frequencia: '21');
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

  @action
  void increment() {
    print(novoMedicamentro.frequencia);
  }

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

  void salvarNovoMedcicamento(
      List<Aviso> avisos,
      String dataInicio,
      int duracao,
      String frequenciaSelecionada,
      //melhorar
      List<bool> diasDaSemana,
      int intervaloDeDias,
      IconData iconData,
      int estoque,
      int reabastecimentoDias,
      String horaAvisarReabastecimento) {
    //
    String diaDasemanaString = jsonEncode(diasDaSemana);
    //List list2 = jsonDecode(json);

    Medicamento novo = Medicamento(
      //  avisos: avisos,
      dataInicio: dataInicio,
      //data fim duração
      frequencia: frequenciaSelecionada,
      diasDasemana: diaDasemanaString,
      intervaloDeDias: intervaloDeDias,
      icone: iconData.toString(),
      estoque: estoque,
      reabastecimentoDias: reabastecimentoDias,
    );

    _db.saveMedicamento(novo);
    print(novo.toString());
  }

  void getMedicamento() async {
    List<Medicamento> l = await _db.getAllMedicamentos();

    for (var i = 0; i < l.length; i++) {
      print(l[i].toString());
    }
  }
}
