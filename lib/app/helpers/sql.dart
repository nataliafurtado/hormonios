import 'dart:developer';

import 'package:Projeto02/app/helpers/dp_helper.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/notificacao.dart';
import 'package:sqflite/sqlite_api.dart';

class Sql {
  Sql() {
    // iniciarGerarNotificacoes();
  }

  DBHelper _db = DBHelper();

  Future<void> listaAvisoStatus() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from avisosStatus');
    for (Map m in maps) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(m);
      print(avisoStatus.toString());
    }
  }

  Future<void> listaNotificacoes() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from notificacoes');
    for (Map m in maps) {
      Notificacao avisoStatus = Notificacao.fromMap(m);
      print(avisoStatus.toString());
    }
  }

  Future<void> listaAvisos() async {
    Database dbTrans = await _db.db;
    List<Map> maps = await dbTrans.rawQuery('Select * from avisos');
    for (Map m in maps) {
      Aviso avisoStatus = Aviso.fromMap(m);
      print(avisoStatus.toString());
    }
  }
}
