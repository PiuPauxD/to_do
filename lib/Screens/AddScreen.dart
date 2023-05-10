import 'package:flutter/material.dart';
import 'package:to_do/Screens/homeScreen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final double ScreenWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: Color.fromARGB(255, 20, 108, 148),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Color.fromARGB(255, 246, 241, 241),
                          size: 42,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Container(
                        child: Text(
                          'Add task',
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 241, 241),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Task name:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 241, 241),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter task name',
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic_outlined,
                                size: 35,
                                color: Color.fromARGB(255, 246, 241, 241),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter task description',
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close_outlined,
                                size: 35,
                                color: Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 246, 241, 241),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: ScreenWidth,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter the date',
                              ),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              size: 35,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close_outlined,
                              size: 35,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter the end time',
                              ),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.watch_later_outlined,
                              size: 35,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close_outlined,
                              size: 35,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.task_alt_outlined),
                            iconSize: 54,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
