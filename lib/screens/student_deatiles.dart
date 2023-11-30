import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/function.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/screens/update_stu.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/detail_screen_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final int index;
  const ProfileScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<StudentModel>>(
      valueListenable: studentvalueLisener,
      builder: (BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        final data = studentList[index];
        final base64Image = data.profileImage;
        final imageBytes = base64.decode(base64Image!);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: appBar('STUDENT INFO'),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
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
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UpdateScreen()));
                      },
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              BeveledRectangleBorder()),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 176, 36, 26))),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
