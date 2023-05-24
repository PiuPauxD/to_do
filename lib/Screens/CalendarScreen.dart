import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/Screens/AddScreen.dart';
import 'package:to_do/Screens/NavBar.dart';
import 'package:to_do/data/AddData.dart';
import 'package:to_do/data/To_DoTile.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _box = Hive.box('box');
  ToDoDataBase db = ToDoDataBase();

// checkBox function
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
  }

  final _tName = TextEditingController();
  final _tDescription = TextEditingController();
  final DateTime _dateTime = DateTime.now();

  void newTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddScreen(
          tName: _tName,
          tDescription: _tDescription,
          dateTime: _dateTime,
          onCancel: () => Navigator.of(context).pop(),
          onSave: () {},
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
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 90,
              child: mainContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      height: 550,
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2123),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return To_DoTile(
                  TaskName: db.toDoList[index][0],
                  TaskDescrip: db.toDoList[index][1],
                  Date:
                      '${_dateTime.day} / ${_dateTime.month} / ${_dateTime.year}',
                  TaskCompleted: db.toDoList[index][2],
                  onChanged: (value) => CheckBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Column backgroundContainer(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 82,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 108, 148),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBar()));
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 42,
                      color: const Color.fromARGB(255, 246, 241, 241),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 10),
                  ),
                  const Text(
                    'Add task',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 246, 241, 241),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
