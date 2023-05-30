import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final icon;
  VoidCallback onPressed;
  MyButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 25, 167, 206),
      child: icon,
    );
  }
}
