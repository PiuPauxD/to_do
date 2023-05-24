import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/Screens/AddScreen.dart';

class To_DoTile extends StatelessWidget {
  final String TaskName;
  final String TaskDescrip;
  final String Date;
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  To_DoTile({
    super.key,
    required this.TaskName,
    required this.TaskDescrip,
    required this.Date,
    required this.TaskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? date = DateTime.now();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete_outline,
                backgroundColor: Color.fromARGB(255, 25, 155, 206),
                borderRadius: BorderRadius.circular(20),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 25, 167, 206),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //checkbox
                Checkbox(
                  value: TaskCompleted,
                  onChanged: onChanged,
                  activeColor: Color.fromARGB(255, 20, 108, 148),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Task name
                    Text(
                      TaskName,
                      style: TextStyle(
                        decoration: TaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 20,
                        color: Color.fromARGB(255, 246, 241, 241),
                      ),
                    ),
                    //Task description
                    Text(
                      TaskDescrip,
                      style: TextStyle(
                        decoration: TaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16,
                        color: Color.fromARGB(255, 246, 241, 241),
                      ),
                    ),
                    //task date
                    Text(
                      '${date.day} /${date.month} /${date.year}',
                      style: TextStyle(
                        decoration: TaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 14,
                        color: Color.fromARGB(255, 246, 241, 241),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
