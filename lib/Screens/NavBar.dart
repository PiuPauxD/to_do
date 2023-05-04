import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:to_do/Screens/homeScreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Screen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  int CurrentIndex = 1;

  void onTap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[CurrentIndex],
      bottomNavigationBar: const GNav(
        rippleColor: Color.fromARGB(255, 25, 167, 206),
        hoverColor: Color.fromARGB(255, 246, 241, 241),
        haptic: true,
        curve: Curves.easeInOutCirc,
        duration: Duration(microseconds: 800),
        gap: 10,
        activeColor: Color.fromARGB(255, 246, 241, 241),
        color: Color.fromARGB(255, 142, 200, 241),
        backgroundColor: Color.fromARGB(255, 20, 108, 148),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        iconSize: 20,
        tabs: [
          GButton(
            icon: Icons.add_outlined,
            text: 'Add Task',
          ),
          GButton(
            icon: Icons.task_alt_sharp,
            text: 'Your Tasks',
          ),
          GButton(
            icon: Icons.calendar_month_outlined,
            text: 'Calendar',
          ),
        ],
      ),
    );
  }
}
