import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider.dart/add_update.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/textfiled.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  final bool checkEdit;
  final int index;
  const AddStudent({super.key, required this.checkEdit, required this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameInput = TextEditingController();
    TextEditingController userAgeInput = TextEditingController();
    TextEditingController userGardianInput = TextEditingController();
    TextEditingController userLocationInput = TextEditingController();

    final formKey = GlobalKey<FormState>();

    final addListProvider = Provider.of<AddAndUpdate>(context);

    if (checkEdit == true) {
      addListProvider.givingValue(index);
      userNameInput = addListProvider.userNameInput;
      userAgeInput = addListProvider.userAgeInput;
      userGardianInput = addListProvider.userGardianInput;
      userLocationInput = addListProvider.userLocationInput;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: checkEdit == true
          ? appBar('EDIT STUDENT INFO')
          : appBar('ADD STUDENT'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              ImageWidget(
                onPressedCam: () {
                  addListProvider.tookPhoto(ImageSource.camera);
                },
                onPressedGal: () {
                  addListProvider.tookPhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 30),
              TextFiledStu(
                hintText: 'Name',
                controller: userNameInput,
                validatorText: 'Please enter name',
                prifixIcons: Icons.person,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                hintText: 'Age',
                controller: userAgeInput,
                validatorText: 'Please enter age',
                prifixIcons: Icons.align_horizontal_center_outlined,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                hintText: 'Guardian Name',
                controller: userGardianInput,
                validatorText: 'Please enter guardian name',
                prifixIcons: Icons.person_2,
              ),
              const SizedBox(height: 20),
              TextFiledStu(
                hintText: 'Location',
                controller: userLocationInput,
                prifixIcons: Icons.location_on_outlined,
                validatorText: 'Please enter location',
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (checkEdit == true) {
                        addListProvider.upDateStudent(
                          userNameInput: userNameInput,
                          userAgeInput: userAgeInput,
                          userGardianInput: userGardianInput,
                          userLocationInput: userLocationInput,
                          imageFile: addListProvider.imageFile,
                          addListProvider: addListProvider,
                          id: index,
                        );
                        Navigator.of(context).pop();
                      } else {
                        addListProvider.addStudenceOnButtenclick(
                          userNameInput: userNameInput,
                          userAgeInput: userAgeInput,
                          userGardianInput: userGardianInput,
                          userLocationInput: userLocationInput,
                          imageFile: addListProvider.imageFile,
                          addListProvider: addListProvider,
                        );
                      }
                    }
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 211, 20, 7),
                    ),
                  ),
                  child: checkEdit == true
                      ? const Text('UPDATE')
                      : const Text('ADD STUDENT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final XFile? imageFile;
  final VoidCallback onPressedCam;
  final VoidCallback onPressedGal;

  const ImageWidget({
    super.key,
    this.imageFile,
    required this.onPressedCam,
    required this.onPressedGal,
  });

  @override
  Widget build(BuildContext context) {
    final addListProvider = Provider.of<AddAndUpdate>(context);

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: addListProvider.imageFile == null
                ? const AssetImage('asset/filepicker.png')
                    as ImageProvider<Object>
                : FileImage(
                    File(addListProvider.imageFile!.path),
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Get.showSnackbar(GetSnackBar(
                  titleText: Text(
                    'Choose Profile photo',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  messageText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: onPressedCam,
                        child: Text(
                          'Camera',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: onPressedGal,
                        child: Text(
                          'Gallery',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  duration: const Duration(seconds: 10),
                  dismissDirection: DismissDirection.down,
                ));
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}