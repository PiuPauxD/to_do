import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/Screens/AddScreen.dart';
import 'package:to_do/data/AddData.dart';
import 'package:to_do/data/To_DoTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedItem;
  String? selectedItemi;

  //reference the hive box
  final _box = Hive.box('box');
  ToDoDataBase db = ToDoDataBase();

  final List<String> item = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];

  final List<String> sortItem = [
    'New tasks',
    'Old tasks',
  ];

  final _tName = TextEditingController();
  final _tDescription = TextEditingController();

  final _dateTime = DateTime.now();

  // checkBox function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_tName.text, _tDescription.text, false]);
      _tName.clear();
      _tDescription.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //add new task
  void newTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddScreen(
          tName: _tName,
          tDescription: _tDescription,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          dateTime: _dateTime,
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    super.initState();
    if (_box.get("TODOLIST") == null) {
      db.initialState();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 108, 148),
        toolbarHeight: 80,
        elevation: 0,
        leading: const Icon(
          Icons.task_alt_sharp,
          color: Color.fromARGB(255, 246, 241, 241),
          size: 42,
        ),
        title: const Text(
          'To-Do',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 241, 241),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Center(
            child: DropdownButton(
              value: selectedItem,
              items: sortItem
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ))
                  .toList(),
              selectedItemBuilder: (BuildContext context) => sortItem
                  .map(
                    (e) => Center(
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 246, 241, 241),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              icon: const Icon(
                Icons.import_export_outlined,
                color: Color.fromARGB(255, 246, 241, 241),
                size: 42,
              ),
              underline: Container(),
              dropdownColor: const Color.fromARGB(255, 20, 108, 148),
              onChanged: (String? value) {
                setState(() {
                  selectedItem = value!;
                });
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        backgroundColor: const Color.fromARGB(255, 25, 167, 206),
        child: const Icon(
          Icons.add_task_outlined,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return To_DoTile(
            taskName: db.toDoList[index][0],
            taskDescrip: db.toDoList[index][1],
            date: '${_dateTime.day} / ${_dateTime.month} / ${_dateTime.year}',
            taskCompleted: db.toDoList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
