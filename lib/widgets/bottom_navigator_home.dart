import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/list_of_student.dart';
import 'package:flutter_application_2/screens/student_adding.dart';

class NavigatorHome extends StatefulWidget {
  const NavigatorHome({super.key});

  @override
  State<NavigatorHome> createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorHome> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const AddtoList(),
    const AddStudent(index: 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: Colors.black,
        elevation: 0,
        height: 50,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.add_to_photos_rounded), label: 'Add Student'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
