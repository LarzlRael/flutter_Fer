import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

import 'package:qr_read/src/models/scan_model.dart';
export 'package:qr_read/src/models/scan_model.dart';

import 'package:uuid/uuid.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initD();
    return _database!;
  }

  initD() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = Path.join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(path,
        version: 1,
        onOpen: (db) => {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Scans('
              ' id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
              ' tipo Text,'
              ' valor tipo Text'
              ')');
        });
  }

  /* nuevoScan(ScanModel nuevoSCan) async {
    final db = await database;
    final res = db.rawInsert(
        'INSERT Into Scans( tipo, valor) VALUES ( ${nuevoSCan.tipo}, ${nuevoSCan.valor})');

    return res;
  } */
  nuevoScan(ScanModel nuevoSCan) async {
    final db = await database;

    final res = db.insert('Scans', nuevoSCan.toJson());

    return res;
  }

// Selecet - get info
  Future<ScanModel?> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<ScanModel>> getScanByTipe(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo = '$tipo'");

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];
    return list;
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deletAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }
}
