import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _head(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _head() {
    return Container(
      height: 80,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Color.fromARGB(255, 20, 108, 148),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.task_alt_sharp,
            color: Color.fromARGB(255, 246, 241, 241),
            size: 42,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            child: Text(
              'Today',
              style: TextStyle(
                color: Color.fromARGB(255, 246, 241, 241),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 32,
            color: Color.fromARGB(255, 246, 241, 241),
          ),
        ],
      ),
    );
  }
}
