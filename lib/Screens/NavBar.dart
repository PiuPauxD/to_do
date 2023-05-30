import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:to_do/Screens/CalendarScreen.dart';
import 'package:to_do/Screens/homeScreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List screen = [
    const HomeScreen(),
    const CalendarScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: GNav(
        tabBorderRadius: 20,
        rippleColor: const Color.fromARGB(255, 25, 167, 206),
        hoverColor: const Color.fromARGB(255, 246, 241, 241),
        haptic: true,
        curve: Curves.easeInOutCirc,
        duration: const Duration(microseconds: 800),
        gap: 10,
        activeColor: const Color.fromARGB(255, 246, 241, 241),
        color: const Color.fromARGB(255, 142, 200, 241),
        backgroundColor: const Color.fromARGB(255, 20, 108, 148),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        iconSize: 20,
        onTabChange: onTap,
        selectedIndex: currentIndex,
        tabs: const [
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
