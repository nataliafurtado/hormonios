import 'dart:async';
import 'dart:developer';

//import 'package:gerenciador/models/item.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/avisos_status.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:Projeto02/app/models/notificacao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// classe medicamento
final String _medicamentos = "medicamentos";
final String _id = "id";
final String _ativo = 'ativo';
final String _nome = "nome";
final String _dataInicio = 'dataInicio';
final String _dataFim = 'dataFim';
final String _icone = 'icone';
final String _diasDasemana = 'diasDasemana';
final String _intervaloDeDias = 'intervaloDeDias';
final String _dosagem = 'dosagem';
final String _medida = 'medida';
final String _observacoes = 'observacoes';
final String _estoque = 'estoque';
final String _quantidadeAntesAvisarReabastecimento =
    'quantidadeAntesAvisarReabastecimento';
final String _horaReabasteciemnto = 'horaReabasteciemnto';
final String _frequencia = 'frequencia';
final String _avisarReabastecimento = 'avisarReabastecimento';

// CLASSE AVISO
final String _avisos = 'avisos';
final String _hora = 'hora';
final String _minuto = 'minuto';
final String _qtd = 'qtd';
final String _medicamentoId = 'medicamentoId';
//CLASSE AVISOSTATUS
final String _avisosStatus = 'avisosStatus';
final String _avisoId = 'avisoId';
final String _dia = 'dia';
final String _horaIngerido = 'horaIngerido';
final String _statusAvisoEnum = 'statusAvisoEnum';
final String _pularEnum = 'pularEnum';
final String _numeroAdiadas = 'numeroAdiadas';
final String _notId = 'notId';

//CLASSE NOTIFICACAO
final String _notificacoes = 'notificacoes';
final String _statusNotificacaoEnum = 'statusNotificacaoEnum';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "listas24.db");
    // print(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $_medicamentos($_id INTEGER PRIMARY KEY, $_nome TEXT," +
              "$_ativo BOOLEAN,$_dataInicio TEXT,$_dataFim TEXT,$_icone INT,$_diasDasemana TEXT," +
              "$_intervaloDeDias INT,$_dosagem int,$_observacoes TEXT,$_estoque INT," +
              "$_quantidadeAntesAvisarReabastecimento INT,$_horaReabasteciemnto TEXT,$_frequencia TEXT,$_medida TEXT,$_avisarReabastecimento BOOLEAN)");

      await db.execute(
          "CREATE TABLE $_avisos($_id INTEGER PRIMARY KEY, $_hora INT,$_minuto INT," +
              "$_qtd INT,$_medicamentoId INT )");
      await db.execute(
          "CREATE TABLE $_avisosStatus($_id INTEGER PRIMARY KEY, $_avisoId INT," +
              "$_dia TEXT,$_horaIngerido TEXT,$_statusAvisoEnum TEXT,$_pularEnum TEXT,$_numeroAdiadas INT,$_notId INT,$_medicamentoId INT)");

      await db.execute("CREATE TABLE $_notificacoes($_id INTEGER PRIMARY KEY," +
          "$_dia TEXT,$_statusNotificacaoEnum TEXT)");
    });
  }

  Future<int> saveMedicamento(Medicamento medicamento) async {
    Database dbTrans = await db;
    int i = await dbTrans.insert(_medicamentos, medicamento.toMap());
    return i;
  }

  Future<int> saveNotificacao(Notificacao not) async {
    Database dbTrans = await db;
    int i = await dbTrans.insert(_notificacoes, not.toMap());
    return i;
  }

  Future<int> updateMedicamento(Medicamento medicamento) async {
    Database dbTrans = await db;
    log('salvand acv avisoss ');
    updateAvisos(medicamento.avisos);
    return await dbTrans.update(_medicamentos, medicamento.toMap(),
        where: "$_id = ?", whereArgs: [medicamento.id]);
  }

//APAGAR TUDO apagarNotificacoesEAvisosStatus TODA DAQUI PARA FRENTE
  Future<void> apagarNotificacoesEAvisosStatus(Medicamento medicamento) async {
    log('apagando restos de mudança horário');
    Database dbTrans = await db;
    final now = DateTime.now();
    List<AvisoStatus> listaAvisoStatus = [];
    for (var aviso in medicamento.avisos) {
      log('aviso id : ' + aviso.id.toString());
      listaAvisoStatus.addAll(await getAvisoStatusNotIdSimples(aviso.id));
    }
    log('lista aviso ' + listaAvisoStatus.length.toString());
    for (AvisoStatus aviSta in listaAvisoStatus) {
      log('aviSta' + aviSta.id.toString());
      await dbTrans
          .rawDelete("DELETE FROM $_notificacoes  where $_id=${aviSta.notId}");
      if (aviSta.dia.isAfter(now)) {
        await dbTrans
            .rawDelete("DELETE FROM $_avisosStatus  where $_id=${aviSta.id}");
      }
    }
  }

  Future<void> apagarTUDONotificacoesEAvisosStatus(
      Medicamento medicamento) async {
    log('APAGANDO RESTOS  DE MEDICAMENTO');
    Database dbTrans = await db;
    final now = DateTime.now();
    List<AvisoStatus> listaAvisoStatus = [];
    for (var aviso in medicamento.avisos) {
      log('aviso id : ' + aviso.id.toString());
      listaAvisoStatus.addAll(await getAvisoStatusNotIdSimples(aviso.id));
    }
    for (AvisoStatus aviSta in listaAvisoStatus) {
      log('aviSta' + aviSta.id.toString());
      await dbTrans
          .rawDelete("DELETE FROM $_notificacoes  where $_id=${aviSta.notId}");

      await dbTrans
          .rawDelete("DELETE FROM $_avisosStatus  where $_id=${aviSta.id}");
    }
  }

  Future<List<AvisoStatus>> getAvisoStatusNotIdSimples(
      int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans.rawQuery(
        'Select * from $_avisosStatus where $_avisoId=$idpassadoinferno');
    List<AvisoStatus> list = List();
    for (Map m in maps) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(m);
      list.add(avisoStatus);
    }
    return list;
  }

  Future<void> listAvisoStatus() async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans.rawQuery('Select * from $_avisosStatus');
    List<AvisoStatus> list = List();
    for (Map m in maps) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(m);
      list.add(avisoStatus);
    }
    for (AvisoStatus av in list) {
      print(av.toString());
    }
  }

  Future<void> updateSimplesAvisoStatus(AvisoStatus aviSta) async {
    Database dbTrans = await db;
    // log(aviSta.toString() + ' not id ');
    int i = await dbTrans.rawUpdate(
        'UPDATE $_avisosStatus SET $_dia= ?, $_statusAvisoEnum= ?,$_numeroAdiadas= ?,$_notId= ?,$_horaIngerido=?,$_pularEnum=? WHERE $_id=?',
        [
          aviSta.dia.toIso8601String(),
          aviSta.statusAvisoEnum.toString(),
          aviSta.numeroAdiadas,
          aviSta.notId,
          aviSta.horaIngerido == null
              ? null
              : aviSta.horaIngerido.toIso8601String(),
          aviSta.pularEnum.toString(),
          aviSta.id
        ]);
    log('upadate aviso status  $i');
  }

  Future<void> updateSimplesAvisoStatus2(AvisoStatus aviSta) async {
    // Database dbTrans = await db;
    // // log(aviSta.toString() + ' not id ');
    // int i = await dbTrans.rawUpdate(
    //     'UPDATE $_avisosStatus SET $_dia= ?, $_statusAvisoEnum= ?,$_numeroAdiadas= ?,$_notId= ?,$_horaIngerido=?,$_pularEnum=? WHERE $_id=?',
    //     [
    //       aviSta.dia.toIso8601String(),
    //       aviSta.statusAvisoEnum.toString(),
    //       aviSta.numeroAdiadas,
    //       aviSta.notId,
    //       aviSta.id,
    //       aviSta.horaIngerido.toIso8601String(),
    //       aviSta.pularEnum.toString()
    //     ]);

    Database dbTrans = await db;
    dbTrans.update(_avisosStatus, aviSta.toMap(),
        where: "$_id = ?", whereArgs: [aviSta.id]);
  }

//   final String _avisosStatus = 'avisosStatus';
// final String _avisoId = 'avisoId';
// final String _dia = 'dia';
// final String _horaIngerido = 'horaIngerido';
// final String _statusAvisoEnum = 'statusAvisoEnum';
// final String _pularEnum = 'pularEnum';
// final String _numeroAdiadas = 'numeroAdiadas';
// final String _notId = 'notId';

  Future<void> updateAvisos(List lista) async {
    Database dbTrans = await db;
    for (Aviso a in lista) {
      return await dbTrans
          .update(_avisos, a.toMap(), where: "$_id = ?", whereArgs: [a.id]);
    }
  }

  Future<void> saveAvisos(List avisosList, int id) async {
    Database dbTrans = await db;
    for (Aviso a in avisosList) {
      a.medicamentoId = id;
      await dbTrans.insert(_avisos, a.toMap());
    }
  }

  Future<List<AvisoStatus>> saveAvisosStatus(List avisosList) async {
    Database dbTrans = await db;
    for (AvisoStatus a in avisosList) {
      a.id = await dbTrans.insert(_avisosStatus, a.toMap());
    }
    return avisosList;
  }

  Future<int> saveAvisoStatus(AvisoStatus avisoStatus) async {
    Database dbTrans = await db;
    var idStatusAviso =
        await dbTrans.insert(_avisosStatus, avisoStatus.toMap());

    return idStatusAviso;
  }

  Future<Medicamento> getMedicamento(int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $_medicamentos where id=$idpassadoinferno');

    if (maps.length > 0) {
      return Medicamento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<Notificacao> getNotificacao(DateTime dia) async {
    String diaToIso = dia.toIso8601String();
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery("Select * from $_notificacoes where $_dia='$diaToIso'");

    if (maps.length > 0) {
      Notificacao not = Notificacao.fromMap(maps.first);
      not.avisosStatus.addAll(await getAvisosStatusNotId(not.id, false, false));
      return not;
    } else {
      return null;
    }
  }

  Future<Notificacao> getNotificacaoId(String id) async {
    int iInt = int.parse(id);
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery("Select * from $_notificacoes where $_id='$iInt'");

    if (maps.length > 0) {
      Notificacao not = Notificacao.fromMap(maps.first);
      not.avisosStatus.addAll(await getAvisosStatusNotId(not.id, true, true));
      return not;
    } else {
      return null;
    }
  }

  Future<Aviso> getAviso(int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $_avisos where id=$idpassadoinferno');
    if (maps.length > 0) {
      return Aviso.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Aviso>> getAvisos(int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans.rawQuery(
        'Select * from $_avisos where medicamentoId=$idpassadoinferno');
    List<Aviso> list = List();
    for (Map m in maps) {
      list.add(Aviso.fromMap(m));
    }
    // log('avisosssss');
    // log(list.length.toString());
    return list;
  }

  Future<List<AvisoStatus>> getAvisosStatusNotId(
      int notIdPassado, bool loadAviso, bool loadMedicamento) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $_avisosStatus where $_notId=$notIdPassado');
    List<AvisoStatus> list = List();
    for (Map m in maps) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(m);
      if (loadAviso) {
        Aviso aviso = await getAviso(m['avisoId']);
        avisoStatus.aviso = aviso;
      }
      if (loadMedicamento) {
        Medicamento medi = await getMedicamento(m['medicamentoId']);
        avisoStatus.medicamento = medi;
      }
      list.add(avisoStatus);
    }
    return list;
  }

  Future<AvisoStatus> getAvisosStatusC(
      int idPassado, bool loadAviso, bool loadMedicamento) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $_avisosStatus where $_id=$idPassado');

    if (maps.length > 0) {
      AvisoStatus avisoStatus = AvisoStatus.fromMap(maps.first);
      if (loadAviso) {
        Aviso aviso = await getAviso(maps.first['avisoId']);
        avisoStatus.aviso = aviso;
      }
      if (loadMedicamento) {
        Medicamento medi = await getMedicamento(maps.first['medicamentoId']);
        avisoStatus.medicamento = medi;
      }
      return avisoStatus;
    } else {
      return null;
    }
  }

  // Future<List<AvisoStatus>> getAvisoStatus(
  //     Aviso aviso, DateTime diaEhora) async {
  //   Database dbTrans = await db;
  //   List<Map> maps = await dbTrans.rawQuery(
  //       'Select * from $_avisosStatus a where a.$_avisoId=$idpassadoinferno and a.$_dia=$diaPassado');
  //   List<AvisoStatus> list = List();
  //   for (Map m in maps) {
  //     list.add(AvisoStatus.fromMap(m));
  //   }
  //   // log('avisosssss');
  //   // log(list.length.toString());
  //   return list;
  // }

  Future<AvisoStatus> getAvisoStatus(int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $_avisosStatus where id=$idpassadoinferno');

    if (maps.length > 0) {
      AvisoStatus aviS = AvisoStatus.fromMap(maps.first);
      aviS.aviso = await getAviso(maps.first['avisoId']);
      return aviS;
    } else {
      return null;
    }
  }

  Future<AvisoStatus> getAvisosStatus(
      int idpassadoinferno, DateTime diaPassado) async {
    String diaa = diaPassado.toIso8601String();
    Database dbTrans = await db;
    List<Map> maps = await dbTrans.rawQuery(
        "Select * from $_avisosStatus a where a.$_avisoId=$idpassadoinferno and a.$_dia='$diaa'");

    if (maps.length > 0) {
      AvisoStatus aviS = AvisoStatus.fromMap(maps.first);
      aviS.aviso = await getAviso(maps.first['avisoId']);
      return aviS;
    } else {
      return null;
    }
  }

  Future<void> deleteAvisosStatus(
      int idpassadoinferno, DateTime diaPassado) async {
    String diaa = diaPassado.toIso8601String();
    Database dbTrans = await db;
    await dbTrans.rawDelete(
        "DELETE FROM $_avisosStatus  where $_avisoId=$idpassadoinferno and $_dia='$diaa'");
  }

  //
  // Future<List<AvisoStatus>> getAvisosStatus(
  //     int idpassadoinferno, DateTime diaPassado) async {
  //   String diaa = diaPassado.toIso8601String();
  //   Database dbTrans = await db;
  //   List<Map> maps = await dbTrans.rawQuery(
  //       'Select * from $_avisosStatus a where a.$_avisoId=$idpassadoinferno and a.$_dia=$diaa');
  //   List<AvisoStatus> list = List();
  //   for (Map m in maps) {
  //     list.add(AvisoStatus.fromMap(m));
  //   }
  //   // log('avisosssss');
  //   // log(list.length.toString());
  //   return list;
  // }

  Future<int> deleteMedicamento(Medicamento medApagar) async {
    Database dbtrans = await db;
    await apagarTUDONotificacoesEAvisosStatus(medApagar);
    for (var i = 0; i < medApagar.avisos.length; i++) {
      await deleteAviso(medApagar.avisos[i]);
    }
    int idApagado = await dbtrans
        .rawDelete('DELETE FROM $_medicamentos WHERE $_id = ?', [medApagar.id]);
    return idApagado;
  }

  Future<int> deleteAviso(avisoApagar) async {
    Database dbtrans = await db;
    int idApagado = await dbtrans
        .rawDelete('DELETE FROM $_avisos WHERE $_id = ?', [avisoApagar.id]);
    return idApagado;
  }

  Future<List> getAllMedicamentos() async {
    Database dbTrasn = await db;
    List listMap = await dbTrasn.rawQuery("SELECT * FROM $_medicamentos");
    List<Medicamento> list = List();
    for (Map m in listMap) {
      list.add(Medicamento.fromMap(m));
    }

    return list;
  }

  Future<List> getAllMedicamentosDentroDasDatas() async {
    Database dbTrasn = await db;

    final now = DateTime.now().toIso8601String();
    List listMap = await dbTrasn.rawQuery(
        "SELECT * FROM $_medicamentos m where m.$_dataInicio < '$now' and (m.$_dataFim is null or m.$_dataFim > '$now') ");
    List<Medicamento> list = List();
    for (Map m in listMap) {
      list.add(Medicamento.fromMap(m));
    }

    return list;
  }

  Future<List> getNotificacao30Dias(DateTime now) async {
    Database dbTrasn = await db;
    DateTime nowCopi = now;
    final nowString = now.toIso8601String();
    final trintaDias = nowCopi.add(Duration(days: 30)).toIso8601String();

    List listMap = await dbTrasn.rawQuery(
        "SELECT * FROM $_notificacoes m where m.$_dia > '$nowString' and m.$_dia <'$trintaDias' ");
    List<Notificacao> list = List();
    for (Map m in listMap) {
      list.add(Notificacao.fromMap(m));
    }

    return list;
  }

  // Future<Item> getItem(String caminho) async {
  //   Database dbLista = await db;
  //   List<Map> maps = await dbLista.query(itemsTable,
  //       columns: [idColumn, nameColumn,idListaTable,'path','marcada','ordem','data','gravacaoTamanho'],
  //       where: "path = ?",
  //       whereArgs: [caminho]);
  //   if (maps.length > 0) {
  //     return Item.fromMap(maps.first);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<int> deleteItem(int id) async {
  //   Database dbLista = await db;
  //   return await dbLista
  //       .delete(itemsTable, where: "$idColumn = ?", whereArgs: [id]);
  // }

  // Future<int> updateLista(Lista lista) async {
  //   Database dbLista = await db;
  //   return await dbLista.update(listaTable, lista.toMap(),
  //       where: "$idColumn = ?", whereArgs: [lista.id]);
  // }

  //  Future<int> updateItem(Item item) async {
  //   Database dbLista = await db;
  //   return await dbLista.update(itemsTable, item.toMap(),
  //       where: "$idColumn = ?", whereArgs: [item.id]);
  // }

  // Future<int> getCountItemsDeLista(Lista lista) async {
  //   Database dbLista = await db;
  //   var qtd = await dbLista.rawQuery(
  //       'SELECT count($idColumn) from $itemsTable where $idListaTable=${lista.id}');
  //   return Sqflite.firstIntValue(qtd);
  // }

  // Future<List> getItems(Lista lista) async {
  //   Database dbLista = await db;
  //   List listMap = await dbLista.rawQuery("SELECT * FROM $itemsTable where $idListaTable=${lista.id}");
  //   List<Item> listItems = List();
  //   for (Map m in listMap) {
  //     listItems.add(Item.fromMap(m));
  //   }
  //  // print(listItems.toString());
  //   return listItems;
  // }

  // Future<int> getNumber() async {
  //   Database dbLista = await db;
  //   return Sqflite.firstIntValue(
  //       await dbLista.rawQuery("SELECT COUNT(*) FROM $listaTable"));
  // }

  // Future close() async {
  //   Database dbLista = await db;
  //   dbLista.close();
  // }
}

// class Lista {
//   int id;
//   String name;

//   Lista();

//   Lista.fromMap(Map map) {
//     id = map[idColumn];
//     name = map[nameColumn];
//   }

//   Map toMap() {
//     Map<String, dynamic> map = {
//       nameColumn: name,
//     };
//     if (id != null) {
//       map[idColumn] = id;
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return "Lista(id: $id, name: $name)";
//   }
// }
