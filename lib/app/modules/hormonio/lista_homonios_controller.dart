import 'dart:convert';
import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/models/bundle.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:mobx/mobx.dart';

part 'lista_homonios_controller.g.dart';

class ListaHomoniosController = _ListaHomoniosBase
    with _$ListaHomoniosController;

abstract class _ListaHomoniosBase with Store {
  DBHelper _db = DBHelper();
  @observable
  List<Medicamento> medicamentosLista = [];

  @action
  void increment() {
    // value++;
  }

  @action
  Future getMedicamentos() async {
    // List<Medicamento> l

    medicamentosLista = await _db.getAllMedicamentos();

    if (medicamentosLista != null) {
      print(medicamentosLista.length.toString() + '    tamanho ');
      for (var i = 0; i < medicamentosLista.length; i++) {
        print(medicamentosLista[i].icone);
      }
    }
  }

  //  'TODOS OS DIAS',
  //   'DIAS ESPECÍFICOS DA SEMANA',
  //   'INTERVALO DE DIAS',
  //   'CICLO RECORRENTE'
  @action
  String carregaTituloDaLista(Medicamento med) {
    SingletonBundle bundle = SingletonBundle();
    if (med.frequencia == bundle.frequencia[0]) {
      return '${med.frequencia}';
    } else if (med.frequencia == bundle.frequencia[1]) {
      String text = '';
      List list2 = jsonDecode(med.diasDasemana);
      for (var i = 0; i < list2.length; i++) {
        if (list2[i] == true) {
          text = text + bundle.diaSemanaCurto[i] + ' ,';
        }
      }
      if (text.length > 2) {
        text = text.substring(0, text.length - 2);
      }
      return text;
    } else if (med.frequencia == bundle.frequencia[2]) {
      return ' A CADA ${med.intervaloDeDias} DIAS ';
    }
  }

  apagarMedicamento(int id) {
    _db.deleteMedicamento(medicamentos.id);
  }

  updateMedicamento() async {
    log('salvando');
    int i = await _db.updateMedicamento(medicamentos);
    Notifications.refazerGerarNotificacoes();
    _db.apagarNotificacoesEAvisosStatus(medicamentos);

    log('updateMedicamento  ' + i.toString());
  }

  @observable
  Medicamento medicamentos;
  @action
  Future getMedicamento(int i) async {
    medicamentos = await _db.getMedicamento(i);

    medicamentos.avisos = await _db.getAvisos(i);

    // print(g.nome + g.id.toString() + 'medicamentos');
    // for (var i = 0; i < medicamentosLista.length; i++) {
    //   print(medicamentosLista[i].icone);
    // }
  }
}
