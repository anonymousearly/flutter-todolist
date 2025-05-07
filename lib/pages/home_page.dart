import 'package:flutter/material.dart';
import '../util/todo_tile.dart';
import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final TextEditingController taskController = TextEditingController();

  //list of tasks
  List toDoList = [
    ["Naruto", false], 
    ["Naruto: Shippuden", false]
  ];

  //check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([taskController.text, false]);
      taskController.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task
  void createNewTask() {
      showDialog(
        context: context, 
        builder: (context) {
        return DialogBox(
          controller: taskController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('My Todo List'), backgroundColor: Colors.blue,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ) ,
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
