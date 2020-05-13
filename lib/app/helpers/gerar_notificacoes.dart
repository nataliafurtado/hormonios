import 'dart:developer';

import 'package:Projeto02/app/enums/statusNotificacoesEnum.dart';
import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:Projeto02/app/models/notificacao.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GerarNotificacoes {
  GerarNotificacoes() {
    iniciarGerarNotificacoes();
  }

  DBHelper _db = DBHelper();
  List<Medicamento> medicamentosLista = [];

  void iniciarGerarNotificacoes() async {
    // PEGAR OS MED DENTRO DAS DATAS DE INICIO E FIM
    medicamentosLista = await _db.getAllMedicamentosDentroDasDatas();
    // HOJE
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);
    // PARA CADA MEDICAMENTO
    for (var med in medicamentosLista) {
      med.avisos = await _db.getAvisos(med.id);
      // PARA CADA AVISO POR DIA
      for (var aviso in med.avisos) {
        List<AvisoStatus> listAvisoStatus = await med.notificacaoClass
            .carrega30diasNotificacao(aviso, lastMidnight, med);

        for (var i = 0; i < listAvisoStatus.length; i++) {
          if (listAvisoStatus[i].notId == null) {
            //VER SE JA TEM NOTIFICAÇÃO NESSE DIA E HORA SALVA NO BANCO
            Notificacao notificacao =
                await _db.getNotificacao(listAvisoStatus[i].dia);
            //SE JÁ EXISTE NOTIFICAÇÃO ADD AVISOSTATUS
            if (notificacao != null) {
              log('SE JÁ EXISTE NOTIFICAÇÃO ADD AVISOSTATUS');
              // AvisoStatus avisJaTinha = notificacao.avisosStatus
              //     .firstWhere((notStat) => notStat.id == listAvisoStatus[i].id);
              // // se não foi add
              // if (avisJaTinha == null) {
              notificacao.avisosStatus.add(listAvisoStatus[i]);
            } else {
              // SENÃO TIVER CRIA ADD E SALVA
              notificacao = Notificacao(
                dia: listAvisoStatus[i].dia,
                statusNotificacaoEnum: StatusNotificacoesEnum.enviada,
                avisosStatus: [listAvisoStatus[i]],
              );
              notificacao.avisosStatus.add(listAvisoStatus[i]);
              notificacao.id = await _db.saveNotificacao(notificacao);
            }
            listAvisoStatus[i].notId = notificacao.id;
            await _db.updateSimplesAvisoStatus(listAvisoStatus[i]);
          } else {
            log('ja tem noti');
            //confere e ver se precisa atualizar
          }
        }

        List<Notificacao> notificacoes = await _db.getNotificacao30Dias(now);

        // PEGA ATODAS AS NOTIFICAÇÕES ATIVAS
        List<PendingNotificationRequest> pendingNotificationRequests =
            await Notifications.pending();

        for (var i = 0; i < notificacoes.length; i++) {
          // PROCURA SE JA EXIXTE NOTIFICAÇÃO NO SITEMA
          var notifComMesmoId = pendingNotificationRequests.firstWhere(
              (not) => not.id == notificacoes[i].id,
              orElse: () => null);
          // SE NÃO EXIXTE  CRIA
          if (notifComMesmoId == null) {
            log('CRIANDO  NOT NOVA');
            await Notifications.notificaPorPushSchedule(
                notificacoes[i].dia, notificacoes[i].id);
          } else {
            log('Ja existe NOT');
          }
        }
      }
    }

    //Notifications.notificaPorPushSchedule();
    //Notifications.cancelALL();

    // se for do tipo periodo pega prozximas 10
  }
}

// log(medicamentosLista.length.toString() + ' frfrfrfrfref  frf frf r  ');
//           log(i.toString() +
//               '   :  ' +
//               listAvisoStatus[i].dia.toIso8601String() +
//               " id  ==>>" +
//               listAviso[i].id.toString());

//         for (var i = 0; i < listAvisoStatus.length; i++) {
//           if (listAvisoStatus[i].notId == null) {
//             // esse avisoStatus não tem not no banco ainda  ainda
//             // ve se ja tem nas notificaçoes com esse dia
//             int indexNotifQueJaTinha = notificacoes
//                 .indexWhere((not) => not.dia == listAvisoStatus[i].dia);

//             if (indexNotifQueJaTinha == -1) {
//               //se não
//               //cria
//               Notificacao novaNot = Notificacao(
//                 dia: listAvisoStatus[i].dia,
//                 avisosStatus: [listAvisoStatus[i]],
//               );
//               // salva
//               novaNot.id = await _db.saveNotificacao(novaNot);

//               /// da update no notid do avisostatus
//               listAvisoStatus[i].notId = novaNot.id;
//               await _db.updateSimplesAvisoStatus(listAvisoStatus[i]);
//               // add na lista
//               notificacoes.add(novaNot);
//               //
//             } else {
//               // ver se ja esta add o aviso status na not
//               int indexAvisoStatusQueJaTinha =
//                   notificacoes[indexNotifQueJaTinha].avisosStatus.indexWhere(
//                       (aviStat) => aviStat.id == listAvisoStatus[i].id);
//               if (indexAvisoStatusQueJaTinha == -1) {
//                 // senão add e salva alteração no aviso status
//                 notificacoes[indexNotifQueJaTinha]
//                     .avisosStatus
//                     .add(listAvisoStatus[i]);
//                 listAvisoStatus[i].notId =
//                     notificacoes[indexNotifQueJaTinha].id;
//                 await _db.updateSimplesAvisoStatus(listAvisoStatus[i]);
//               } else {
//                 //se sin nao faz nada
//                 log(' jatinha add');
//               }
//             }
//           } else {
//             Notificacao notificacao =
// //pega not no banco
// // ve se ja tem na notificacoes ,, se nao tiver add

//           }
// }
