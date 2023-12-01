import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider.dart/add_students.dart';
import 'package:provider/provider.dart';

class SpashScreen extends StatelessWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<AddStuProvider>(context);
    listProvider.loggin(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'asset/download__1_-removebg-preview.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight,
          color: Colors.white,
          height: 200,
        ),
      ),
    );
  }
}
