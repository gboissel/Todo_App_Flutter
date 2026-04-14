import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/models/todo.dart';
import 'package:http/http.dart' as http;
class MyAPI{
  Future<List<Task>> getTasks() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('tasks.json');
    final Map<String,dynamic> json = jsonDecode(dataString);
    if (json['tasks']!=null){
      final tasks = <Task>[];
      json['tasks'].forEach((element){
        tasks.add(element);
      });
      return tasks;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );

      if (response.statusCode == 200) {
        // On force le cast en List<dynamic> pour éviter les erreurs d'itérations
        final List<dynamic> body = jsonDecode(response.body) as List<dynamic>;

        return body.map((item) => Todo.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Erreur HTTP: ${response.statusCode}');
      }
    } catch (e) {
      // Capture les erreurs réseau ou de parsing
      throw Exception('Erreur lors de la récupération des todos: $e');
    }
  }
}
