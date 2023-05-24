import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_do/Screens/NavBar.dart';
import 'package:to_do/data/button.dart';

import '../data/AddData.dart';

class AddScreen extends StatelessWidget {
  final box = Hive.box('box');
  //text controller
  final tName;
  final tDescription;

  VoidCallback onSave;
  VoidCallback onCancel;
  DateTime date = DateTime.now();

  AddScreen({
    super.key,
    required this.tName,
    required this.tDescription,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 142, 200, 241),
      content: Container(
        height: 250,
        child: Column(
          children: [
            //label text
            const Text(
              'New task',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 246, 241, 241),
              ),
            ),
            //task name
            TextField(
              controller: tName,
              decoration: InputDecoration(
                hintText: 'Task name',
              ),
            ),
            SizedBox(height: 10),
            //task description
            Container(
              alignment: Alignment.bottomLeft,
              child: Expanded(
                child: TextField(
                  controller: tDescription,
                  decoration: InputDecoration(
                    hintText: 'Task description',
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            //calendar
            Container(
              alignment: Alignment.bottomLeft,
              child: Expanded(
                child: TextButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2123),
                    );
                    if (newDate == Null) return;

                    date = newDate!;
                  },
                  child: Text(
                    '${date.day} /${date.month} /${date.year}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 246, 241, 241),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(
                  icon: Icon(
                    Icons.done_outline_outlined,
                    color: Color.fromARGB(255, 246, 241, 241),
                  ),
                  onPressed: onSave,
                ),
                //cancel button
                MyButton(
                  icon: Icon(
                    Icons.west_outlined,
                    color: Color.fromARGB(255, 246, 241, 241),
                  ),
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
