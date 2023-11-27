import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/function.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAndUpdate extends ChangeNotifier {
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  late TextEditingController userNameInput;
  late TextEditingController userAgeInput;
  late TextEditingController userGardianInput;
  late TextEditingController userLocationInput;
  late StudentModel studentModel;

  Future<void> addStudenceOnButtenclick({
    required userNameInput,
    required userAgeInput,
    required userGardianInput,
    required userLocationInput,
    required imageFile,
    required addListProvider,
  }) async {
    if (imageFile == null) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please add your image',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
      return;
    }
    final name = userNameInput.text.trim();
    final age = userAgeInput.text.trim();
    final gardian = userGardianInput.text.trim();
    final location = userLocationInput.text.trim();
    final bytes = await imageFile!.readAsBytes();
    final String base64Image = base64Encode(bytes);

    if (name.isEmpty || age.isEmpty || gardian.isEmpty || location.isEmpty) {
      return;
    }

    final student = StudentModel(
        name: name,
        age: age,
        gardian: gardian,
        location: location,
        profileImage: base64Image);
    students.addStudent(student);
    userNameInput.text = '';
    userAgeInput.text = '';
    userGardianInput.text = '';
    userLocationInput.text = '';
    addListProvider.imageFile = null;
    notifyListeners();
  }

  Future<void> upDateStudent({
    required userNameInput,
    required userAgeInput,
    required userGardianInput,
    required userLocationInput,
    required imageFile,
    required addListProvider,
    required id,
  }) async {
    if (imageFile == null) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please add your image',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
      return;
    }
    final name = userNameInput.text.trim();
    final age = userAgeInput.text.trim();
    final gardian = userGardianInput.text.trim();
    final location = userLocationInput.text.trim();
    final bytes = await imageFile!.readAsBytes();
    final String base64Image = base64Encode(bytes);

    if (name.isEmpty || age.isEmpty || gardian.isEmpty || location.isEmpty) {
      return;
    }
    final student = StudentModel(
        name: name,
        age: age,
        gardian: gardian,
        location: location,
        profileImage: base64Image);
    students.updateStudent(id, student);
    userNameInput.text = '';
    userAgeInput.text = '';
    userGardianInput.text = '';
    userLocationInput.text = '';
    addListProvider.imageFile = null;
    notifyListeners();
  }

  givingValue(index) {
    userNameInput = TextEditingController();
    userAgeInput = TextEditingController();
    userGardianInput = TextEditingController();
    userLocationInput = TextEditingController();

    final studentList = studentvalueLisener.value;
    studentModel = studentList[index];

    userNameInput.text = studentModel.name;
    userAgeInput.text = studentModel.age.toString();
    userGardianInput.text = studentModel.gardian;
    userLocationInput.text = studentModel.location;
    // imageFile = studentModel.profileImage;
    // imageFile = XFile( studentModel.profileImage!);
  }

  disposese() {
    userNameInput.dispose();
    userAgeInput.dispose();
    userGardianInput.dispose();
    userLocationInput.dispose();
    notifyListeners();
  }

  tookPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    imageFile = pickedFile;
    notifyListeners();
  }
}
