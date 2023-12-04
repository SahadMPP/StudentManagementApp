import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/update_stu.dart';
import 'package:flutter_application_2/student_provider/add_students.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/button.dart';
import 'package:flutter_application_2/widgets/detail_screen_card.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final int index;
  const ProfileScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar('STUDENT INFO'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Consumer<AddStuProvider>(
            builder: (context, studentProvider, child) {
              final data = studentProvider.listOfStudents[index];
              final bytes = data.profileImage;
              final imageBytes = base64.decode(bytes);
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Image(
                        image: MemoryImage(imageBytes),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  getprofile('Name', data.name, Icons.person),
                  const SizedBox(height: 15),
                  getprofile('Age', data.age, Icons.view_agenda),
                  const SizedBox(height: 15),
                  getprofile('Gaurdian Name', data.gardian, Icons.person_2),
                  const SizedBox(height: 15),
                  getprofile('Location', data.location, Icons.location_city),
                  const SizedBox(height: 30),
                  BuildBotton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateScreen(
                                  index: index,
                                )));
                      },
                      text: 'Edit')
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
