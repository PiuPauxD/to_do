import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_do/Screens/NavBar.dart';
import 'package:to_do/data/button.dart';

import '../data/AddData.dart';

class AddScreen extends StatefulWidget {
  final tName;
  final tDescription;
  DateTime dateTime = DateTime.now();

  VoidCallback onSave;
  VoidCallback onCancel;

  AddScreen({
    super.key,
    required this.tName,
    required this.tDescription,
    required this.onSave,
    required this.onCancel,
    required this.dateTime,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box('box');

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
              controller: widget.tName,
              decoration: InputDecoration(
                hintText: 'Task name',
              ),
            ),
            SizedBox(height: 10),
            //task description
            TextField(
              controller: widget.tDescription,
              decoration: InputDecoration(
                hintText: 'Task description',
              ),
            ),
            SizedBox(height: 10),
            //calendar
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: widget.dateTime,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2123));
                    setState(() {
                      widget.dateTime = newDate!;
                    });
                  },
                  child: Text(
                    '${widget.dateTime.day} /${widget.dateTime.month} /${widget.dateTime.year}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 246, 241, 241),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(
                  icon: Icon(
                    Icons.done_outline_outlined,
                    color: Color.fromARGB(255, 246, 241, 241),
                  ),
                  onPressed: widget.onSave,
                ),
                //cancel button
                MyButton(
                  icon: Icon(
                    Icons.west_outlined,
                    color: Color.fromARGB(255, 246, 241, 241),
                  ),
                  onPressed: widget.onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
