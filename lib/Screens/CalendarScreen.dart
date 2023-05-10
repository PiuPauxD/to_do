import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/Screens/NavBar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _head(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(1900),
                      lastDay: DateTime.utc(2999),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 167, 206),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.circle_outlined),
                              iconSize: 28,
                              color: Color.fromARGB(255, 246, 241, 241),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Task name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 246, 241, 241),
                                  ),
                                ),
                                Text(
                                  'Task Description',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 246, 241, 241),
                                  ),
                                ),
                                Text(
                                  '05.05.2023',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 246, 241, 241),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _head extends StatelessWidget {
  const _head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            color: Color.fromARGB(255, 20, 108, 148),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => NavBar()),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Color.fromARGB(255, 246, 241, 241),
                    size: 42,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                ),
                Text(
                  'Calendar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 241, 241),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
