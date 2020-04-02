import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GerarNotificacoes {
  GerarNotificacoes() {
    iniciarGerarNotificacoes();
  }

  DBHelper _db = DBHelper();
  List<Medicamento> medicamentosLista = [];

  void iniciarGerarNotificacoes() async {
    log('GERAR NOTIFICAÇÔES--GERAR NOTIFICAÇÔES--GERAR NOTIFICAÇÔES--GERAR NOTIFICAÇÔES-GERAR NOTIFICAÇÔES-');
    // PEGAR OS MED DENTRO DAS DATAS DE INICIO E FIM
    medicamentosLista = await _db.getAllMedicamentosDentroDasDatas();
    for (var med in medicamentosLista) {
      //CARREGA OS AVISOS
      med.avisos = await _db.getAvisos(med.id);
    }
    log(medicamentosLista.length.toString() + ' frfrfrfrfref  frf frf r  ');

    List<PendingNotificationRequest> pendingNotificationRequests =
        await Notifications.pending();

    // pegar as notificações (só as daqui para frente )

    //  confere se esta tudo gerado já se sim acaba
    // se não estiver gera as faltantes
  }
}
