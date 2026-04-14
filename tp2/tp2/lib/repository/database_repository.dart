import 'package:sqflite/sqflite.dart';
import 'package:tp2/models/task.dart';
class databaseRepository{
  final Database bd;
  databaseRepository({required this.bd});

  Future<List<Task>> getTasks() async{
    List<Map<String, dynamic>> tasks = await bd.query('tasks');
    if (tasks.isNotEmpty){
      return tasks.map((task) => Task.fromMap(task)).toList();
    }return [];
  }
  Future<void> addTask(Task task) async{
    await bd.insert('tasks',task.toMap());
  }
  Future<void> deleteTask(Task task) async{
    await bd.delete('tasks',where: 'id=?',whereArgs: [task.id]);
  }
  Future<void> updateTask(Task task) async{
    await bd.update('tasks',task.toMap(),where: 'id=?',whereArgs: [task.id]);
  }

}

