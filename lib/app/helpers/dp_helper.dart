import 'dart:async';

//import 'package:gerenciador/models/item.dart';
import 'package:Projeto02/app/models/avisos.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// classe medicamento
final String medicamentos = "medicamentos";

//atributos
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

// classe aviso
final String _avisos = 'avisos';
final String _hora = 'hora';
final String _qtd = 'qtd';
final String _medicamentoId = 'medicamentoId';

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
    final path = join(databasesPath, "listas11.db");
    // print(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $medicamentos($_id INTEGER PRIMARY KEY, $_nome TEXT," +
          "$_ativo BOOLEAN,$_dataInicio TEXT,$_dataFim TEXT,$_icone INT,$_diasDasemana TEXT," +
          "$_intervaloDeDias INT,$_dosagem int,$_observacoes TEXT,$_estoque INT," +
          "$_quantidadeAntesAvisarReabastecimento INT,$_horaReabasteciemnto TEXT,$_frequencia TEXT,$_medida TEXT,$_avisarReabastecimento BOOLEAN)");

      await db.execute(
          "CREATE TABLE $_avisos($_id INTEGER PRIMARY KEY, $_hora TEXT," +
              "$_qtd INT,$_medicamentoId INT)");
    });
  }

  Future<int> saveMedicamento(Medicamento medicamento) async {
    Database dbTrans = await db;
    int i = await dbTrans.insert(medicamentos, medicamento.toMap());
    return i;
  }

  Future<void> saveAvisos(List avisosList, int id) async {
    Database dbTrans = await db;
    for (Aviso a in avisosList) {
      a.medicamentoId = id;
      await dbTrans.insert(_avisos, a.toMap());
    }
  }

  Future<Medicamento> getMedicamento(int idpassadoinferno) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans
        .rawQuery('Select * from $medicamentos where id=$idpassadoinferno');

    if (maps.length > 0) {
      return Medicamento.fromMap(maps.first);
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

  Future<int> deleteLista(int id) async {
    Database dbtrans = await db;
    return await dbtrans
        .delete(medicamentos, where: "$id = ?", whereArgs: [id]);
  }

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

  Future<List> getAllMedicamentos() async {
    Database dbTrasn = await db;
    List listMap = await dbTrasn.rawQuery("SELECT * FROM $medicamentos");
    List<Medicamento> list = List();
    for (Map m in listMap) {
      list.add(Medicamento.fromMap(m));
    }

    return list;
  }

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
