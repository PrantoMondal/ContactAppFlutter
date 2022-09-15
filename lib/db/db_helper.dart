import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  static Future<Database> open() async{
    final rootPath = await getDatabasesPath();
     final dbPath = join(rootPath,'contact.db');
     return openDatabase(dbPath,version: 1,onCreate: (db,version){
       db.execute(sql)
     });


  }
}