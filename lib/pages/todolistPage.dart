import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key});
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      taskController.clear(); // Clear entry area
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(title: Text('To-Do List')),
       body: Column(
         children: [
           Expanded(
             child: ListView.builder(
               itemCount: tasks.length,
               itemBuilder: (context, index) => ListTile(
                 title: Text(tasks[index]),
                 trailing:
                     IconButton(icon: Icon(Icons.delete), onPressed: () => completeTask(index)),
               ),
             ),
           ),
           Padding(
             padding:
                 const EdgeInsets.symmetric(horizontal:16.0),
             child : Row(children:[
              Expanded(child : TextField(controller :taskController)), //It uses the TextField widget for task entry.
              IconButton(icon :Icon(Icons.add),onPressed :()=>addTask(taskController.text)) //add task

            ])
           
           
          )
        ],
      )
      
        
       
     );
   }
}