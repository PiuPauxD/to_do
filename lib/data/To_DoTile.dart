import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class To_DoTile extends StatelessWidget {
  final String taskName;
  final String taskDescrip;
  final String date;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  To_DoTile({
    super.key,
    required this.taskName,
    required this.taskDescrip,
    required this.date,
    required this.taskCompleted,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete_sweep_outlined,
                backgroundColor: const Color.fromARGB(255, 25, 155, 206),
                borderRadius: BorderRadius.circular(20),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 167, 206),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: const Color.fromARGB(255, 20, 108, 148),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Task name
                    Text(
                      taskName,
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 246, 241, 241),
                      ),
                    ),
                    //Task description
                    Text(
                      taskDescrip,
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 246, 241, 241),
                      ),
                    ),
                    //task date
                    Text(
                      '${date.day} /${date.month} /${date.year}',
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 246, 241, 241),
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
