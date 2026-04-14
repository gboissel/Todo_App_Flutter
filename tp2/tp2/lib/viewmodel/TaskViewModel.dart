import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/repository/database_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final databaseRepository databaseRepo;
  List<Task> list = [];
  TaskViewModel({required this.databaseRepo}) {
    getTasks();
  }


  Future<void> getTasks() async{
    list = await databaseRepo.getTasks();
    notifyListeners();
  }
  Future<void> addTask(Task task) async{
    await databaseRepo.addTask(task);
    await getTasks();
    notifyListeners();
  }
  Future<void> deleteTask(Task task) async{
    await databaseRepo.deleteTask(task);
    await getTasks();
    notifyListeners();
  }
  Future<void> updateTask(Task task) async{
    await databaseRepo.updateTask(task);
    await getTasks();
    notifyListeners();
  }

}
