import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_do/Screens/NavBar.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('box');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    ),
  );
}
