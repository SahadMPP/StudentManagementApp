import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider.dart/update_provider.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/textfiled.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  bool isValid = false;
  final formKey = GlobalKey<FormState>();
  final userNameInput = TextEditingController();
  String word = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Edit Detiles'),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Center(
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('asset/filepicker.png')),
              ),
              const SizedBox(height: 50),
              TextFiledStu(
                hintText: 'Name',
                controller: userNameInput,
                validatorText: 'Please enter name',
                prifixIcons: Icons.person,
              ),
              const SizedBox(height: 20),
              const TextFiledStu(
                hintText: 'Age',
                validatorText: 'Please enter age',
                prifixIcons: Icons.align_horizontal_center_outlined,
              ),
              const SizedBox(height: 20),
              const TextFiledStu(
                hintText: 'Guardian Name',
                validatorText: 'Please enter guardian name',
                prifixIcons: Icons.person_2,
              ),
              const SizedBox(height: 20),
              const TextFiledStu(
                hintText: 'Location',
                prifixIcons: Icons.location_on_outlined,
                validatorText: 'Please enter location',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 211, 20, 7),
                    ),
                  ),
                  child: Text(
                    'UPDATE',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
