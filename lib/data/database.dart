import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference our hive box
  final _myBox = Hive.box('mybox');

  //run this method if the box is empty
  void createInitialData() {
    toDoList = [
      ["Naruto", false],
      ["Naruto: Shippuden", false],
    ];
  }

  // load the data from the hive box
  Future<void> loadData() async {
    toDoList = _myBox.get("TODOLIST");
  } 

  //update the data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }

  // //delete data
  // void deleteData() {
  //   _myBox.delete("TODOLIST");
  // }
}
