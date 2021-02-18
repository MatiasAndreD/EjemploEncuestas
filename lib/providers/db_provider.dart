import 'package:prueba_formgoogle_app/models/EncuestaModel.dart';
export 'package:prueba_formgoogle_app/models/EncuestaModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, 'EncuestaDB.db');
    print(path);

    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Encuesta(
            id TEXT PRIMARY KEY,
            estado INTEGER
          )
        ''');
    });
  }

  Future<int> nuevoScanRaw(Encuesta encuesta) async {
    final id = encuesta.id;
    final estado = encuesta.estado;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Encuesta( id, estado )
        VALUES( '$id', $estado)
    ''');

    return res;
  }

  Future<List<Encuesta>> findAll() async {
    final db = await database;
    final res = await db.query('Encuesta');

    return res.isNotEmpty
        ? res.map((poll) => Encuesta.fromJson(poll)).toList()
        : [];
  }

  Future<bool> findById(String id) async {
    final db = await database;
    final res = await db.query('Encuesta', where: 'id = ?', whereArgs: [id]);

    return res.isEmpty;
  }
/*

  


  Future<List<ScanModel>> findByTip(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateById(ScanModel scan) async {
    final db = await database;
    final res = await db
        .update('Scans', scan.toJson(), where: "id = ?", whereArgs: [scan.id]);

    return res;
  }

  Future<int> deleteById(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.delete('Scans');

    return res;
  } */
}
