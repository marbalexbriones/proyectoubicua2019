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
    if(_database != null) return _database;
    String pathU = "user.db";
    String pathR = "reminder.db";
    String queryU = "CREATE TABLE User ("
        "idUser integer primary key,"
        "name TEXT,"
        "lname TEXT,"
        "email TEXT,"
        "password TEXT,"
        "mobile TEXT,"
        "sex TEXT,"
        "age TEXT,"
        "comments TEXT"
        ")";
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
        
    _database = await getDatabaseInstanace(pathU,queryU);
    /*_database = await getDatabaseInstanace(pathR,queryR);*/
    return _database;
  }

  Future<Database> getDatabaseInstanace(String pathA, String query) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, pathA);
     return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(query);
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

   //Query
  //muestra un solo usuario por el id la base de datos
  Future<Reminder> getReminderWithId(int id) async {
    final db = await database;
    var response = await db.query("Reminder", where: "idReminder = ?", whereArgs: [id]);
    return response.isNotEmpty ? Reminder.fromMap(response.first) : null;
  }


 //Insert user
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

  //Insert Reminder
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

  
  //Update
  updateUser(User user) async {
    final db = await database;
    var response = await db.update("User", user.toMap(),
    where: "idUser = ?", whereArgs: [user.idUser]);
    return response;
  }


  //Update
  updateReminder(Reminder reminder) async {
    final db = await database;
    var response = await db.update("Reminder", reminder.toMap(),
    where: "idReminder = ?", whereArgs: [reminder.idReminder]);
    return response;
  }
  




}