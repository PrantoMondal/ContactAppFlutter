import 'package:contactapp/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const String createTableContact = '''create table $tableContact(
  $tableContactColId integer primary key,
  $tableContactColName text,
  $tableContactColNumber text,
  $tableContactColEmail text,
  $tableContactColAddress text,
  $tableContactColDob text,
  $tableContactColGender text,
  $tableContactColImage text,
  $tableContactColFavourite integer
  )''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'contact.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(createTableContact);
    });
  }

  static Future<int> insertContact(ContactModel contactModel) async {
    final db = await open();
    return db.insert(tableContact, contactModel.toMap());
  }
}
