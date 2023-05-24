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

  DateTime date = DateTime.now();

  final List<String> _item = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];

  final _tName = TextEditingController();
  final _tDescription = TextEditingController();

  // checkBox function
  void CheckBoxChanged(bool? value, int index) {
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
    if (_box.get("TODOLIST") == null) {
      db.initialState();
    } else {
      db.loadData();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 108, 148),
        toolbarHeight: 80,
        elevation: 0,
        leading: const Icon(
          Icons.task_alt_sharp,
          color: Color.fromARGB(255, 246, 241, 241),
          size: 42,
        ),
        title: Text(
          'To-Do',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 241, 241),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            width: 130,
            child: DropdownButton<String>(
              iconEnabledColor: Color.fromARGB(255, 246, 241, 241),
              iconSize: 30,
              value: selectedItem,
              items: _item
                  .map((e) => DropdownMenuItem(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 60,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                          ),
                        ),
                        value: e,
                      ))
                  .toList(),
              selectedItemBuilder: ((BuildContext context) => _item
                  .map(
                    (e) => Text(
                      e,
                      style: TextStyle(
                        color: Color.fromARGB(255, 246, 241, 241),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .toList()),
              dropdownColor: Color.fromARGB(255, 20, 108, 148),
              isExpanded: true,
              hint: const Text(
                'Today',
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 241, 241),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              underline: Container(),
              onChanged: ((value) {
                setState(() {
                  selectedItem = value!;
                });
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        backgroundColor: Color.fromARGB(255, 25, 167, 206),
        child: const Icon(
          Icons.add_task_outlined,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return To_DoTile(
            TaskName: db.toDoList[index][0],
            TaskDescrip: db.toDoList[index][1],
            Date: 'Date: ${date.day} / ${date.month} / ${date.year}',
            TaskCompleted: db.toDoList[index][2],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
