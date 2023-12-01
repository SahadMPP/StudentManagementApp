import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/function.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/widgets/bottom_navigator_home.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddStuProvider extends ChangeNotifier {
  File? selectedImage;
  final nameEditInput = TextEditingController();
  final ageEditInput = TextEditingController();
  final gadianEditInput = TextEditingController();
  final locationEditInput = TextEditingController();
  List<StudentModel> listOfStudents = [];

  Future imagecollect() async {
    final pikedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikedImage == null) {
      return;
    }

    selectedImage = File(pikedImage.path);
    notifyListeners();
  }

  Future addtoList() async {
    if (selectedImage == null) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please add your image',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
    }
    final name = nameEditInput.text.trim();
    final age = ageEditInput.text.trim();
    final gardian = gadianEditInput.text.trim();
    final location = locationEditInput.text.trim();
    final bytes = await selectedImage!.readAsBytes();
    final String imagebytes = base64Encode(bytes);

    final stu = StudentModel(
        name: name,
        age: age,
        gardian: gardian,
        location: location,
        profileImage: imagebytes);
    listOfStudents.add(stu);

    students.addStudent(stu);

    nameEditInput.text = '';
    ageEditInput.text = '';
    gadianEditInput.text = '';
    locationEditInput.text = '';
    selectedImage = null;
    notifyListeners();
  }

  delete(index) {
    listOfStudents.removeAt(index);
    students.deleteValue(index);
    Get.showSnackbar(const GetSnackBar(
      message: 'Student is removed',
      duration: Duration(seconds: 2),
      backgroundColor: Colors.grey,
    ));
    notifyListeners();
  }

  forUpdateGivingVal(index) {
    final data = listOfStudents[index];
    nameEditInput.text = data.name;
    ageEditInput.text = data.age;
    gadianEditInput.text = data.gardian;
    locationEditInput.text = data.location;
    notifyListeners();
  }

  updateStudent(id, StudentModel value) {
    listOfStudents[id] = value;
    notifyListeners();
  }

  Future loggin(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const NavigatorHome(),
        ),
        (route) => false);
  }

  getAllStudents() {
    notifyListeners();
  }
}
