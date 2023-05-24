import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference box
  final _box = Hive.box('box');

  //1st opening
  void initialState() {
    toDoList = [];
  }

//load the data
  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

//update database
  void updateDataBase() {
    _box.put("TODOLIST", toDoList);
  }
}
