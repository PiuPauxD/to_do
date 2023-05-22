import 'package:flutter/material.dart';
import 'package:to_do/data/To_DoTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedItem;
  String? selectedItemi;

  DateTime date = DateTime.now();

  final List<String> _item = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];

  // list tasks
  List ToDoList = [
    ['make tutorial', 'hello', false],
    ['make tutorial', 'holla', false],
    ['make tutorial', 'holla', false],
    ['make tutorial', 'holla', false],
    ['make tutorial', 'holla', false],
    ['make tutorial', 'holla', false],
  ];

  // checkBox function
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][2] = !ToDoList[index][2];
    });
  }

  @override
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
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return To_DoTile(
            TaskName: ToDoList[index][0],
            TaskDescrip: ToDoList[index][1],
            Date: 'Date: ${date.day} / ${date.month} / ${date.year}',
            TaskCompleted: ToDoList[index][2],
            onChanged: (value) => CheckBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
