import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import 'package:tp2/UI/myapp.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    databaseFactory = databaseFactoryFfiWeb;
  }
  final database = await openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT,tags TEXT,difficulty INT, nbhours INT, completed BOOLEAN)'
    );
  },
  version: 1,
  );

  runApp( MyApp(database: database));
}

