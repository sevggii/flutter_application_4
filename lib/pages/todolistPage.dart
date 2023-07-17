import 'package:flutter/material.dart';

class Task {
  final String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key});

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<Task> tasks = [];

   Widget build(BuildContext context) {
     TextEditingController taskController = TextEditingController();

     return Scaffold(
       appBar: AppBar(title: Text('To-Do List')),
       body: Column(
         children: [
           Expanded(
             child: ListView.builder(
               itemCount: tasks.length,
               itemBuilder:(context,index){
                 return ListTile(
                   leading :Checkbox(
                     value :tasks[index].isCompleted ?? false, // Add null check and default value
                     onChanged :(value)=>setState((){tasks[index].isCompleted = value ?? false;}), // Add null check and default value
                   ),
                   title :Text(tasks[index].name,
                     style: TextStyle(decoration:
                       tasks[index].isCompleted ? TextDecoration.lineThrough : null),
                   ),

                   trailing:
                       IconButton(icon :Icon(Icons.delete), onPressed :()=>setState(()=>tasks.removeAt(index))),
                 );
                }
              ),
            ),
            Padding(padding :
              const EdgeInsets.symmetric(horizontal :16.0),
              child :
                Row(children:[
                  Expanded(child:
                    TextField(
                      controller: taskController,
                      onSubmitted: (value) => setState(() { 
                        tasks.add(Task(name:value));
                        }),
                    ),
                  ),
                  IconButton(icon :Icon(Icons.add), onPressed :()=> setState(() { 
                      tasks.add(Task(name:taskController.text));
                      taskController.clear();
                    }))
                ])
            )
          ],
        ),
      );
    }
}