import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/models/gaji.dart';
import '../models/employee.dart';

class DB_Helper {
  static DB_Helper _dbHelper;
  static Database _database;
  DB_Helper._createObject();
  Future<Database> initDb() async {
//untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

//create, read databases
    var itemDatabase = openDatabase(path, version: 1, onCreate: _createDb);

//mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

//buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute('''
CREATE TABLE pegawai (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
umur INTEGER,
alamat TEXT,
jabatan TEXT
)
''');
    await db.execute('''
CREATE TABLE gaji (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
jabatan INTEGER,
gajiPokok INTEGER,
hariKerja INTEGER,
tunjangan INTEGER,
dedukasi INTEGER,
jht INTEGER,
pph INTEGER,
benefit INTEGER

)
''');
  }

//create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('pegawai', object.toMap());
    return count;
  }

//create databases gaji
  Future<int> insertGaji(Gaji object) async {
    Database db = await this.initDb();
    int count = await db.insert('gaji', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db.update('pegawai', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);

    return count;
  }

//update databases gaji
  Future<int> updateGaji(Gaji object) async {
    Database db = await this.initDb();
    int count = await db
        .update('gaji', object.toMap(), where: 'id=?', whereArgs: [object.id]);

    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('pegawai', where: 'id=?', whereArgs: [id]);

    return count;
  }

  Future<int> deleteGaji(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('gaji', where: 'id=?', whereArgs: [id]);

    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Gaji>> getGajiList() async {
    var itemMapList = await selectGaji();
    int count = itemMapList.length;
    List<Gaji> itemList = List<Gaji>();
    for (int i = 0; i < count; i++) {
      itemList.add(Gaji.fromMap(itemMapList[i]));
    }
    return itemList;
  }

//select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('pegawai', orderBy: 'name');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectGaji() async {
    Database db = await this.initDb();
    var mapList = await db.query('gaji', orderBy: 'name');
    return mapList;
  }

  factory DB_Helper() {
    if (_dbHelper == null) {
      _dbHelper = DB_Helper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
