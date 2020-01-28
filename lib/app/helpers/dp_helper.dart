import 'dart:async';

//import 'package:gerenciador/models/item.dart';
import 'package:Projeto02/app/models/medicamento.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// classe medicamento
final String medicamentos = "medicamentos";

//atributos
final String id = "id";
final String ativo = 'ativo';
final String nome = "nome";
final String dataInicio = 'dataInicio';
final String dataFim = 'dataFim';
final String icone = 'icone';
final String diasDasemana = 'diasDasemana';
final String intervaloDeDias = 'intervaloDeDias';
final String dosagem = 'dosagem';
final String observacoes = 'observacoes';
final String estoque = 'estoque';
final String reabastecimentoDias = 'reabastecimentoDias';
final String horaReabasteciemnto = 'horaReabasteciemnto';
final String frequencia = 'frequencia';

// classe aviso
final String avisos = 'avisos';
final String hora = 'hora';
final String qtd = 'qtd';

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
    final path = join(databasesPath, "listas1.db");
    // print(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $medicamentos($id INTEGER PRIMARY KEY, $nome TEXT," +
          "$ativo TEXT,$dataInicio TEXT,$dataFim TEXT,$icone TEXT,$diasDasemana TEXT," +
          "$intervaloDeDias INT,$dosagem TEXT,$observacoes TEXT,$estoque INT," +
          "$reabastecimentoDias INT,$horaReabasteciemnto TEXT,$frequencia TEXT)");

      // await db.execute(
      //     "CREATE TABLE $avisos($id INTEGER PRIMARY KEY, $hora TEXT," +
      //         "$qtd INT)");
    });
  }

  Future<Medicamento> saveMedicamento(Medicamento medicamento) async {
    Database dbTrans = await db;
    medicamento.id = await dbTrans.insert(medicamentos, medicamento.toMap());
    return medicamento;
  }

  // Future<Item> saveItem(Item item) async {
  //   Database dbLista = await db;
  //   item.id = await dbLista.insert(itemsTable, item.toMap());
  //   return item;
  // }

  Future<Medicamento> getMedicamento(int id) async {
    Database dbTrans = await db;
    List<Map> maps = await dbTrans.query(medicamentos,
        //columns: [idColumn, nameColumn],
        where: "$id = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Medicamento.fromMap(maps.first);
    } else {
      return null;
    }
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

  // Future<int> deleteLista(int id) async {
  //   Database dbLista = await db;
  //   return await dbLista
  //       .delete(listaTable, where: "$idColumn = ?", whereArgs: [id]);
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
