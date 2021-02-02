import 'dart:io';

import 'package:path/path.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get getDB async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'scans.db');
    // print('PATH: $path');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE  Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
    });
  }

  Future<int> create(ScanModel scanModel) async {
    final db = await getDB;
    final res = await db.insert('Scans', scanModel.toJson());
    return res;
  }

  Future<ScanModel> read(int id) async {
    final db = await getDB;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> readByType(String tipo) async {
    final db = await getDB;
    final res =
        await db.query('Scans', where: "tipo LIKE ?", whereArgs: [tipo]);
    List<ScanModel> scans = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
    return scans;
  }

  Future<int> update(ScanModel model) async {
    final db = await getDB;
    final res = await db.update('Scans', model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
    return res;
  }

  Future<int> delete(int id) async {
    final db = await getDB;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteScans() async {
    final db = await getDB;
    final res = await db.delete('Scans');
    return res;
  }

  Future<List<ScanModel>> getScans() async {
    final db = await getDB;
    final res = await db.query('Scans');
    List<ScanModel> scans = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
    return scans;
  }
}
