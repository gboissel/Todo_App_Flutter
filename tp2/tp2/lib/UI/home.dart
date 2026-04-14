import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/UI/details.dart';
import 'package:provider/provider.dart';
import 'package:tp2/viewmodel/TaskViewModel.dart';


class home extends StatelessWidget{
  home({super.key});
  String tags='';
  @override
  Widget build(BuildContext context) {
    final List<Task> myTasks = context.watch<TaskViewModel>().list;
    return ListView.builder(
        itemCount: myTasks.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            elevation: 7,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child:  Text(myTasks[index].id.toString()
                ),
              ),
              title: Text(myTasks[index].title),
              subtitle: Text(myTasks[index].description),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(task: myTasks[index])),
                );
              },

            ),
          );

        }
    );
  }


}