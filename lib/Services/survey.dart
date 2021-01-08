import 'package:sqflite/sqflite.dart';
import 'package:pericia_iml/Services/checkconn.dart';
import 'package:pericia_iml/Services/db.dart';
import 'package:http/http.dart' as http;
import 'package:pericia_iml/Services/prefs.dart';

class ServicesSurvey {
  LocalDatabase localDatabase = LocalDatabase();
  Database _database;
  final CheckConnection checkConnection = CheckConnection();
  Prefs prefs = Prefs();

  insertLocalDB(List<Map<String, dynamic>> surveyList) async {
    _database = await localDatabase.openDB();
    surveyList.forEach((row) async {
      await _database.insert('survey', row);
    });
    await prefs.setNotUpdated();
  }

  uploadData(Map<String, dynamic> row) async {
    _database = await localDatabase.openDB();
    var id = row['id'];

    http.Response response = await http.post(
        "http://167.172.202.168/custom_projects/vendemmia/insert_survey.php",
        body: row);

    print(response.statusCode.toString());
    print(response.body);

    await _database.rawUpdate("UPDATE survey SET regStatus='U' WHERE id='$id'");
  }

  syncronizeData() async {
    bool hasConnection = await checkConnection.checkConnection();
    if (hasConnection) {
      _database = await localDatabase.openDB();
      final response = await _database
          .rawQuery("SELECT * FROM survey WHERE regStatus = 'L'");

      if (response.length > 0) {
        response.forEach((row) {
          uploadData(row);
        });
      }
      await prefs.setUpdated();
    }
  }

  Future<String> countCollected() async {
    _database = await localDatabase.openDB();
    final response = await _database.rawQuery('SELECT COUNT(*) FROM survey');
    return Sqflite.firstIntValue(response).toString();
  }

  Future<String> countNotSyncronized() async {
    _database = await localDatabase.openDB();
    final response = await _database
        .rawQuery('SELECT COUNT(*) FROM survey WHERE regStatus="L"');
    return Sqflite.firstIntValue(response).toString();
  }
}
