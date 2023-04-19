import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_constants.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class DatabaseHelper {
  static Database? _db;

  static Future<Database?> openDataBase() async {
    _db = await openDatabase(join(await getDatabasesPath(), 'user.db'),
        onCreate: (database, version){
          return database.transaction((txn) async {
            await txn.execute("CREATE TABLE ${DBConstants.userTable}(customerId INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, customerDob TEXT, bvnMatch TEXT, delinquentLoans TEXT)");
          });
        }, version: 1);

    return _db;
  }


  //when passing the data. Pass a map object.
  static Future<int?> insertModel<T>(String tableName, T data) async{
    if(_db != null){
      try{
        return _db!.insert(tableName, data as Map<String, dynamic>, conflictAlgorithm: ConflictAlgorithm.replace);
      } on DatabaseException catch(e) {
        e.isDuplicateColumnError();
      }
    }

    return null;
  }

  static Future<void> insertModelBatch<T>(String tableName, List<T> data) async{
    if(_db != null){
      try {
        _db!.transaction((txn) async {
          final batch = txn.batch();
          for(var item in data){
            batch.insert(tableName, item as Map<String, dynamic>, conflictAlgorithm: ConflictAlgorithm.replace);
          }
          await batch.commit();
        });
      } on Exception catch(e) {}
    }
  }

  static Future<int?> updateModel<T>(String tableName, String idConstant, T id, T data) async {
    if(_db != null){
      return _db!.update(tableName, data as Map<String, dynamic>, where: "$idConstant = ?", whereArgs: [id]);
    }
    return null;
  }

  static Future<int?> deleteModel<T>(String tableName, String idConstant, T id) async {
    if(_db != null){
      return _db!.delete(tableName, where: "$idConstant = ?", whereArgs: [id]);
    }

    return null;
  }

  static Future<Map<String, dynamic>?> getById<T>(String tableName, String idConstant, T id) async {
    if(_db != null){
      try{
        final data = await _db!.query(tableName, where: "$idConstant = ?", whereArgs: [id]);
        if(data.isNotEmpty){
          return data.first;
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  static Future<List<Map<String, dynamic>>?> getAllModel<T>(String tableName) async {
    if(_db != null){
      try{
        final data = await _db!.query(tableName);
        return data;
      } on Exception {
        return null;
      }
    }
    return null;
  }

  static Future<List<Map<String, dynamic>>?> getAllModelById<T>(String tableName, String idConstant, T id) async {
    if(_db != null){
      try{
        final data = await _db!.query(tableName, where: "$idConstant = ?", whereArgs: [id]);
        return data;
      } on Exception {
        return null;
      }
    }
    return null;
  }


}