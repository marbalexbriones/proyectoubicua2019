import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';


class PastilleroDataBaseProvider{
  PastilleroDataBaseProvider._();

  static final PastilleroDataBaseProvider db = PastilleroDataBaseProvider._();
  Database _database;

  //para evitar que abra varias conexciones una y otra vez podemos usar algo como esto..
  Future<Database> get database async {
    if(_database != null) {
      return _database;
    }
    String pathR = "database.db";
    String queryR = "CREATE TABLE Reminder ("
      "idReminder integer primary key,"
      "idUser integer,"
      "medicine TEXT,"
      "quantity TEXT,"
      "unit TEXT,"
      "frequency TEXT,"
      "quantityAva TEXT,"
      "indication TEXT"
    ")";
    String queryU = "CREATE TABLE User ("
      "idUser integer primary key,"
      "name TEXT,"
      "last_name TEXT,"
      "email TEXT,"
      "password TEXT,"
      "mobile TEXT,"
      "gender TEXT,"
      "age INTEGER,"
      "parent_id INT"
      ")";
    _database = await getDatabaseInstanace(pathR, queryR, queryU);
    return _database;
  }

  Future<Database> getDatabaseInstanace(String pathA, String query, String query2) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, pathA);
    return await openDatabase(
      path, 
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(query);
        await db.execute(query2);
      });
  }

// Muestra todos los Usuarios
  Future<List<User>> getAllUsers() async {
    final db = await database;
    var response = await db.query("User");
    List<User> list = response.map((c) => User.fromMap(c)).toList();
    return list;
  }

// Muestra todos los recordatorios
 Future<List<Reminder>> getAllReminders() async {
    final db = await database;
    var response = await db.query("Reminder");
    List<Reminder> list = response.map((c) => Reminder.fromMap(c)).toList();
    return list;
  }

  //Query
  //muestra un solo usuario por el id la base de datos
  Future<User> getUserWithId(int id) async {
    final db = await database;
    var response = await db.query("User", where: "idUser = ?", whereArgs: [id]);
    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }

  Future<User> getUserWithEmail(String email) async {
    final db = await database;
    var response = await db.query("User", where: "email = ?", whereArgs: [id]);
    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }

  //Query
  //muestra un solo usuario por el id la base de datos
  Future<Reminder> getReminderWithId(int id) async {
    final db = await database;
    var response = await db.query("Reminder", where: "idReminder = ?", whereArgs: [id]);
    return response.isNotEmpty ? Reminder.fromMap(response.first) : null;
  }


 //Inserta usuairo
  addUserToDatabase(User user) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(idUser)+1 as id FROM User");
    int id = table.first["idUser"];
    user.idUser = id;
    var raw = await db.insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;    

  }

  //Inserta Reminder
  addReminderToDatabase(Reminder reminder) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(idReminder)+1 as id FROM Reminder");
    int id = table.first["idReminder"];
    reminder.idReminder = id;
    var raw = await db.insert(
      "Reminder",
      reminder.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;    

  }

  //Elimina todos los usuarios
  deleteAllUser() async {
    final db = await database;
    db.delete("User");
  } 

  // Elimina usuario por id
  deleteUserWithId(int id) async {
    final db = await database;
    return db.delete("User", where: "idUser = ?", whereArgs: [id]);
  } 

  //Elimina todos los reminder
  deleteAllReminder() async {
    final db = await database;
    db.delete("Reminder");
  } 

  // Elimina reminder por id
  deleteReminderWithId(int id) async {
    final db = await database;
    return db.delete("Reminder", where: "idReminder = ?", whereArgs: [id]);
  } 

  
  //Actualiza usuario
  updateUser(User user) async {
    final db = await database;
    var response = await db.update("User", user.toMap(),
    where: "idUser = ?", whereArgs: [user.idUser]);
    return response;
  }


  //Actualizar recordatorios
  updateReminder(Reminder reminder) async {
    final db = await database;
    var response = await db.update("Reminder", reminder.toMap(),
    where: "idReminder = ?", whereArgs: [reminder.idReminder]);
    return response;
  }
}