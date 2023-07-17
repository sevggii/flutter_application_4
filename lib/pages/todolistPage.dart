import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String workName;
  bool isCompleted;

  Task({required this.id, required this.workName, this.isCompleted = false});
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
                     value :tasks[index].isCompleted ?? false,
                     onChanged :(value)=>setState((){tasks[index].isCompleted = value ?? false;}),
                   ),
                   title :Text(tasks[index].workName,
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
                        var uuid = Uuid().v4();
                        tasks.add(Task(id: uuid, workName:value));
                        }),
                    ),
                  ),
                  IconButton(icon :Icon(Icons.add), onPressed :()=> setState(() { 
                      var uuid = Uuid().v4();
                      tasks.add(Task(id: uuid, workName:taskController.text));
                      taskController.clear();
                    }))
                ])
            )
          ],
        ),
      );
    }
}