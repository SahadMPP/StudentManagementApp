import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider/add_students.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/button.dart';
import 'package:flutter_application_2/widgets/textfiled.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  final int index;
  const AddStudent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar('ADD STUDENT'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Consumer<AddStuProvider>(
            builder: (context, addStudent, child) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: addStudent.selectedImage == null
                                ? Image.asset(
                                    'asset/filepicker.png',
                                  )
                                : Image.file(
                                    File(addStudent.selectedImage!.path),
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      Positioned(
                        left: 80,
                        top: 90,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                addStudent.imagecollect();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFiledStu(
                    hintText: 'Name',
                    controller: addStudent.nameEditInput,
                    validatorText: 'Please enter name',
                    prifixIcons: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  TextFiledStu(
                    hintText: 'Age',
                    controller: addStudent.ageEditInput,
                    validatorText: 'Please enter age',
                    prifixIcons: Icons.align_horizontal_center_outlined,
                  ),
                  const SizedBox(height: 20),
                  TextFiledStu(
                    hintText: 'Guardian Name',
                    controller: addStudent.gadianEditInput,
                    validatorText: 'Please enter guardian name',
                    prifixIcons: Icons.person_2,
                  ),
                  const SizedBox(height: 20),
                  TextFiledStu(
                    hintText: 'Location',
                    controller: addStudent.locationEditInput,
                    prifixIcons: Icons.location_on_outlined,
                    validatorText: 'Please enter location',
                  ),
                  const SizedBox(height: 50),
                  BuildBotton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          addStudent.addtoList(context);
                        }
                      },
                      text: 'ADD STUDENT'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
