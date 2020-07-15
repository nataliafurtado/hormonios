import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/helpers/notifications.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:Projeto02/app/models/notificacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sqflite/sqlite_api.dart';

class Sql {
  Sql() {
    // iniciarGerarNotificacoes();
  }

  DBHelper _db = DBHelper();

  Future<List<String>> listaAvisoStatus() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from avisosStatus');
    List<String> list = [];
    for (Map m in maps) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(m);
      print(avisoStatus.toString());
      list.add(avisoStatus.toString());
    }
    return list;
  }

  Future<List<String>> listaNotificacoes() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from notificacoes');
    List<String> list = [];
    for (Map m in maps) {
      Notificacao avisoStatus = Notificacao.fromMap(m);
      print(avisoStatus.toString());
      list.add(avisoStatus.toString());
    }
    return list;
  }

  Future<List<String>> listaAvisos() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from avisos');
    List<String> list = [];
    for (Map m in maps) {
      Aviso avisoStatus = Aviso.fromMap(m);
      list.add(avisoStatus.toString());
      print(avisoStatus.toString());
    }
    return list;
  }

  Future<List<String>> listaMeds() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from medicamentos');
    List<String> list = [];
    for (Map m in maps) {
      Medicamento avisoStatus = Medicamento.fromMap(m);
      list.add(avisoStatus.toString());
      print(avisoStatus.toString());
    }
    return list;
  }

  Future<List<String>> listaNotNot() async {
    List<PendingNotificationRequest> listNot = await Notifications.pending();
    List<String> list = [];
    for (PendingNotificationRequest m in listNot) {
      var text = 'id:' +
          m.id.toString() +
          ' ' +
          m.body +
          ' ' +
          m.title +
          ' ' +
          m.payload;
      list.add(text);
    }
    return list;
  }
}
