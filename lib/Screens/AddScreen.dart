import 'package:flutter/material.dart';
import 'package:to_do/Screens/NavBar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 200, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 108, 148),
        toolbarHeight: 80,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => NavBar()),
                ),
              );
            });
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Color.fromARGB(255, 246, 241, 241),
            size: 42,
          ),
        ),
        title: const Text(
          'Add task',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 241, 241),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            MainContainer(),
          ],
        ),
      ),
    );
  }
}

Container MainContainer() {
  return Container(
    height: 550,
    width: 340,
    child: Column(
      children: [
        SizedBox(height: 20),
        const Text(
          'Task name:',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 241, 241),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        TaskName(),
        TaskDescription(),
        SizedBox(height: 60),
        const Text(
          'Date:',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 241, 241),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        dateTime(),
        EndTime(),
        Spacer(),
        Save(),
      ],
    ),
  );
}

GestureDetector Save() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 80,
      height: 80,
      alignment: Alignment.bottomRight,
      child: Icon(
        Icons.task_alt_outlined,
        size: 68,
        color: Color.fromARGB(255, 246, 241, 241),
      ),
    ),
  );
}

Widget EndTime() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter the endtime',
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
  );
}

Widget dateTime() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
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
            Icons.close_outlined,
            size: 35,
            color: Color.fromARGB(255, 246, 241, 241),
          ),
        ),
      ],
    ),
  );
}

Padding TaskDescription() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
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
            Icons.close_outlined,
            size: 35,
            color: Color.fromARGB(255, 246, 241, 241),
          ),
        ),
      ],
    ),
  );
}

Padding TaskName() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Enter task name',
      ),
      style: TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
