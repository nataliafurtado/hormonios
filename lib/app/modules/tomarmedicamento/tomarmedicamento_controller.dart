import 'dart:developer';

import 'package:Projeto02/app/enums/statusAvisoEnum.dart';
import 'package:Projeto02/app/enums/tomarMedicamentoEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/notificacao.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'tomarmedicamento_controller.g.dart';

class TomarmedicamentoController = _TomarmedicamentoControllerBase
    with _$TomarmedicamentoController;

abstract class _TomarmedicamentoControllerBase with Store {
  DBHelper _db = DBHelper();

  //
  // METODOS DO CHEGAR TOMAR NOTIFICAÇÕES
  //
  @observable
  AvisoStatus avisoStatus;

  @action
  Future<void> carregaStatusAviso(String id) async {
    avisoStatus = await _db.getAvisosStatusC(int.parse(id), true, true);
  }

  @action
  pular(int indexPularEnum, AvisoStatus avisoStatusPassado) {
    avisoStatusPassado.statusAvisoEnum = StatusAvisoEnum.pulado;
    avisoStatusPassado.pularEnum = PularEnum.values[indexPularEnum];
    _db.updateSimplesAvisoStatus2(avisoStatusPassado);
    log(PularEnum.values[indexPularEnum].toString());
    //Navigator.pop(context);
    Modular.to.pushNamed('/calendario');
    //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  @action
  tomar(DateTime hora, AvisoStatus avisoStatusPassado) {
    avisoStatusPassado.statusAvisoEnum = StatusAvisoEnum.ingerido;
    avisoStatusPassado.horaIngerido = hora;
    _db.updateSimplesAvisoStatus2(avisoStatusPassado);
    //Navigator.pop(context);
    log(hora.toIso8601String());
    log(avisoStatusPassado.id.toString());
    Modular.to.pushNamed('/calendario');
    //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  @action
  adiar(DateTime novaHora, AvisoStatus avisoStatusPassado) async {
    avisoStatusPassado.statusAvisoEnum = StatusAvisoEnum.atrasado;
    avisoStatusPassado.numeroAdiadas = 1;
    // Notifications.refazerNotificaPorPushSchedule(novaHora, avisoStatus.notId);
    log(novaHora.toIso8601String());
    log(avisoStatusPassado.statusAvisoEnum.toString());
    _db.updateSimplesAvisoStatus2(avisoStatusPassado);
    //Navigator.pop(context);

    Modular.to.pushNamed('/calendario');
    //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  //
  // METODOS DO CHEGAR NOTIFICACOES
  //
  @observable
  Notificacao notificacao;

  void carregaNotificacao(String idNot) async {
    log('not id ' + idNot);
    // await Notifications.carregaNotificacao(idNot);
    //  erro na logica .. quando tem mais aviso estatus no memso hora só mandar uma
    //  ,, ou mandar duas mas descarregar a aoutra quando carregar analisar  melhor
    // avisoStatus = await _db.getAvisoStatus(int.parse(idNot));
    notificacao = await _db.getNotificacaoId(idNot);
    //log(notificacao.avisosStatus[1].id.toString());
  }

  @action
  tomarTodos(DateTime hora) {
    for (var aviStat in notificacao.avisosStatus) {
      tomar(hora, aviStat);
    }
    // avisoStatus.statusAvisoEnum = StatusAvisoEnum.ingerido;
    // avisoStatus.horaIngerido = hora;
    // // _db.saveAvisoStatus(avisoStatus);
    // //Navigator.pop(context);
    // log(hora.toIso8601String());
    // Modular.to.pushNamed('/calendario');
    // //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  @action
  pularTodos(int indexPularEnum) {
    for (var aviStat in notificacao.avisosStatus) {
      pular(indexPularEnum, aviStat);
    }
    // avisoStatus.statusAvisoEnum = StatusAvisoEnum.ingerido;
    // avisoStatus.horaIngerido = hora;
    // // _db.saveAvisoStatus(avisoStatus);
    // //Navigator.pop(context);
    // log(hora.toIso8601String());
    // Modular.to.pushNamed('/calendario');
    // //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  @action
  adiarTodos(DateTime novaHora) {
    for (var aviStat in notificacao.avisosStatus) {
      adiar(novaHora, aviStat);
    }
    // avisoStatus.statusAvisoEnum = StatusAvisoEnum.ingerido;
    // avisoStatus.horaIngerido = hora;
    // // _db.saveAvisoStatus(avisoStatus);
    // //Navigator.pop(context);
    // log(hora.toIso8601String());
    // Modular.to.pushNamed('/calendario');
    // //Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }
}
