import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentvalueLisener = ValueNotifier([]);

Student students = Student();

class Student extends ChangeNotifier {
  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;
    getAllstudents();

    await studentDB.put(id, value);
  }

  Future<void> getAllstudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentvalueLisener.value.clear();
    studentvalueLisener.value.addAll(studentDB.values);
    studentvalueLisener.notifyListeners();
  }

  Future<void> deleteValue(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.delete(id);
    getAllstudents();
  }

  Future<void> updateStudent(int id, StudentModel value) async {
    log('working update');
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    if (studentDB.containsKey(id)) {
      await studentDB.put(id, value);
      int index =
          studentvalueLisener.value.indexWhere((student) => student.id == id);
      if (index != -1) {
        studentvalueLisener.value[index] = value;
        studentvalueLisener.notifyListeners();
      }
    }
    value.id = id;
    await studentDB.put(id, value);
  }
}
