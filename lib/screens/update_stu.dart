import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/student_provider.dart/add_students.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/textfiled.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  final int index;
  UpdateScreen({super.key, required this.index});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddStuProvider>(context);
    addProvider.forUpdateGivingVal(index);
    final data = addProvider.listOfStudents[index];
    TextEditingController userNameInput = addProvider.nameEditInput;
    TextEditingController ageNameInput = addProvider.ageEditInput;
    TextEditingController gadianNameInput = addProvider.gadianEditInput;
    TextEditingController locationNameInput = addProvider.locationEditInput;

    final imageBytes1 = base64.decode(data.profileImage);

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
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(65),
                        child: CircleAvatar(
                          radius: 60,
                          child: addProvider.selectedImage == null
                              ? Image.memory(imageBytes1)
                              : Image.file(
                                  File(addProvider.selectedImage!.path),
                                ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                addProvider.imagecollect();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFiledStu(
                hintText: 'Name',
                controller: userNameInput,
                validatorText: 'Please enter name',
                prifixIcons: Icons.person,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                controller: ageNameInput,
                hintText: 'Age',
                validatorText: 'Please enter age',
                prifixIcons: Icons.align_horizontal_center_outlined,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                controller: gadianNameInput,
                hintText: 'Guardian Name',
                validatorText: 'Please enter guardian name',
                prifixIcons: Icons.person_2,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                controller: locationNameInput,
                hintText: 'Location',
                prifixIcons: Icons.location_on_outlined,
                validatorText: 'Please enter location',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final bytes =
                        await addProvider.selectedImage!.readAsBytes();
                    final String imagebytes = base64Encode(bytes);
                    final stu = StudentModel(
                        name: userNameInput.text,
                        age: ageNameInput.text,
                        gardian: gadianNameInput.text,
                        location: locationNameInput.text,
                        profileImage: addProvider.selectedImage == null
                            ? data.profileImage
                            : imagebytes);
                    if (formKey.currentState!.validate()) {
                      addProvider.updateStudent(index, stu);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
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
