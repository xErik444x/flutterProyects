import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Task{
  int id;
  bool completed;
  String name;
  Task(this.name,this.completed);

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "completed":completed?1 : 0
    };
  }

  Task.fromMap(Map<String,dynamic> map) {
    name = map["name"];
    completed = map["completed"] == 1;
    id = map["id"];
  }
  }
  
  class DatabaseMain{
    Database _db;
  
    initDB() async{
      _db = await openDatabase('tareas.db',
       version: 3,
       onCreate: (db, version) {
         db.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT NOT NULL, completed INTEGER DEFAULT 0);");
       },
      onUpgrade: (db, oldVersion, newVersion) {
         // db.execute("ALTER TABLE tasks ADD COLUMN completed INTEGER DEFAULT 0 ;");
        
       
      },

       );
    }
  
    insert (Task task) async{
      _db.insert("tasks", task.toMap());
    }
    
    Future<List<Task>> getAllTasks() async {
     List<Map<String, dynamic>> results = await _db.query("tasks");
      if(results.length >0){
          return results.map((map) => Task.fromMap(map)).toList();
      }else{
        return null;
      }
     
  }

  updateTask(Task task) async {
    _db.update("tasks", task.toMap(),where: "id = ?", whereArgs:[task.id] );
  }

  deleteTask(Task task) async{
    _db.delete("tasks",where: "id = ?",whereArgs:[task.id]);
  }

}