import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';


class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(

              "Add Task", textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(autofocus: true,
              textAlign: TextAlign.center, onChanged: (newTask) {
                newTaskTitle = newTask;
              },),
            FlatButton(onPressed: () {
              final task = Task(name:  newTaskTitle!);
              Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
              Navigator.pop(context);
              },
              child: const Text('Add', style: TextStyle(color: Colors.white,),),
              color: Colors.lightBlueAccent,)
          ],
        ),
      ),
    );
  }
}
