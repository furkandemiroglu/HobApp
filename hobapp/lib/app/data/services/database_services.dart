// ignore_for_file: depend_on_referenced_packages, prefer_is_empty, avoid_print

import 'package:hobapp/app/data/models/users_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static const int _version = 1;
  static const String _dbName = "Users.db";

  DatabaseService._instance();

  static Future<Database> _getDB() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT, nameSurname TEXT NOT NULL, date TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL,zodiac TEXT);"),
        version: _version);
    return db;
  }

  static Future<int> saveUsers(Users users) async {
    final db = await _getDB();

    final isEmailUniq = await isEmailUnique(users.email!);
    if (!isEmailUniq) {}

    return await db.insert(
      "Users",
      users.toJson(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static Future<bool> isEmailUnique(String email) async {
    final db = await _getDB();
    const query = 'SELECT COUNT(*) FROM Users WHERE email = ?';
    final result = await db.rawQuery(query, [email]);
    final count = Sqflite.firstIntValue(result);
    return count == 0;
  }

  static Future<int> updateUsers(Users users) async {
    final db = await _getDB();
    return await db.update("Users", users.toJson(),
        where: 'id = ?',
        whereArgs: [users.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUseres(Users users) async {
    final db = await _getDB();
    return await db.delete(
      "Note",
      where: 'id = ?',
      whereArgs: [users.id],
    );
  }

  static Future<Users?> getUserByEmail(String email) async {
    final db = await _getDB();

    List<Map> maps = await db.query('Users',
        columns: ['id', 'nameSurname', 'date', 'email', 'password', 'zodiac'],
        where: 'email = ?',
        whereArgs: [email]);
    if (maps.length > 0) {
      return Users.fromJson(maps.first);
    }
    return null;
  }

  static Future updateUserPassword(String email, String newPassword) async {
    try {
      final db = await _getDB();
      // Veritabanındaki parolayı güncelle
      var result = await db.update(
        'users',
        {'password': newPassword},
        where: 'email = ?',
        whereArgs: [email],
      );
      if (result > 0) {
        print('OKEYYY');
      }
    } catch (e) {
      print('Bir hata oluştu: $e');
    }
    // Veritabanı bağlantısını alın

    return null;
  }

  static Future<List<Users>?> getAllUsers() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Users");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Users.fromJson(maps[index]));
  }
}
