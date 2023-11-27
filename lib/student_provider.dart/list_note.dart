import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/function.dart';
import 'package:flutter_application_2/widgets/bottom_navigator_home.dart';
import 'package:get/get.dart';

class ListNotifier extends ChangeNotifier {
  deleteValue(data) {
    if (data.id != null) {
      students.deleteValue(data.id!, data);
      Get.showSnackbar(const GetSnackBar(
        message: 'Student is removed',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: 'Student id is missing!',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> loggin(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const NavigatorHome(),
        ),
        (route) => false);
  }
}
