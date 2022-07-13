import 'package:sub_bagussh/data/models/tvclil/tvclil_table.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperTvclil { static DatabaseHelperTvclil? _databaseHelpertvclil; DatabaseHelperTvclil._instance(){
   _databaseHelpertvclil = this;}

factory DatabaseHelperTvclil() => 
   _databaseHelpertvclil ?? DatabaseHelperTvclil._instance();

static Database? 
   _databasetvclil;

Future<Database?> get databasetvclil async
  {
    if (_databasetvclil == null)
    {
      _databasetvclil = await _initDb();
    }
    return _databasetvclil;
  }

static const String _tblWatchlisttvclil = 'watchlisttv';

Future<Database> _initDb() async {final path = await getDatabasesPath();final databasePath ='$path/dicodingtvs.db';

var db = 
  await openDatabase
    (databasePath, version: 1,
      onCreate: _onCreate);
        return db;
}

  void _onCreate
    (Database db, int version) 
      async{
      await db.execute('''
      CREATE TABLE  $_tblWatchlisttvclil (
      id INTEGER PRIMARY KEY, name TEXT, overview TEXT, posterPath TEXT );''');}

Future<int> 
  insertWatchlistTv
    (TvclilTable tv) async {
      final db = 
        await databasetvclil;
         return await db!.insert
           (_tblWatchlisttvclil, tv.toJson());
}

Future<int> 
  removeWatchlistTv
  (TvclilTable tv) async{
    final db = 
      await databasetvclil;
        return await db!.delete(
         _tblWatchlisttvclil,
           where: 'id = ?',
             whereArgs: [tv.id],
  );
}

Future<Map<String, dynamic>?> getTvById(int id) async 
{
  final db = await databasetvclil;
    final results = await db!.query(
      _tblWatchlisttvclil,
        where: 'id = ?',
          whereArgs: [id],
);

if (results.isNotEmpty){
  return results.first;} 
    else{
      return null;}
}

Future<List
  <Map
    <String, dynamic>>> 
      getWatchlistTv() async {

final db = 
  await databasetvclil;
    final List<Map<String, dynamic>> 
      results = await db!.query (_tblWatchlisttvclil);return results;
  }
}