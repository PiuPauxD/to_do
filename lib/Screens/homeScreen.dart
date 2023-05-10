import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedItem;
  String? selectedItemi;

  final List<String> _item = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];

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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            width: 200,
            child: DropdownButton<String>(
                value: selectedItem,
                items: _item
                    .map((e) => DropdownMenuItem(
                          child: Container(
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
                hint: Text(
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
                })),
          ),
        ],
      ),
    );
  }
}
