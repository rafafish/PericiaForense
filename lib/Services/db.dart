import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database _database;

  Future<Database> openDB() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), 'tc_vendemmia.db'),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE survey(id TEXT,datahora_inicio TEXT,datahora_fim TEXT,sobre_novo_posicionamento TEXT,evento_de_lancamento TEXT,melhorar_suas_operacoes TEXT,regStatus TEXT)');
      });
      var dbpath = await getDatabasesPath();
      print(dbpath);
    }
    return _database;
  }
}
