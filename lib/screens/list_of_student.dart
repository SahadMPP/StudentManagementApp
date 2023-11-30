import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/function.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/screens/student_deatiles.dart';
import 'package:flutter_application_2/student_provider.dart/list_note.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/functions/list_screen.dart';

class AddtoList extends StatelessWidget {
  const AddtoList({super.key});

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListNotifier>(context);
    students.getAllstudents();
    return Scaffold(
      appBar: appBar('LIST OF STUDENT'),
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: studentvalueLisener,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                GlobalKey<FormState> formkey2 = GlobalKey();
                final data = studentList[index];
                final base64Image = data.profileImage;
                final imageBytes = base64.decode(base64Image!);
                return Dismissible(
                  key: formkey2,
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 95, 52, 49),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 270),
                      child: Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    listDismissFun(
                        data: data,
                        onPressedYes: () {
                          listProvider.deleteValue(data);
                          Navigator.of(context).pop();
                        },
                        onPressedNo: () {
                          Navigator.of(context).pop();
                          students.getAllstudents();
                        },
                        context: context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 23, 23, 23),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: Image(
                              fit: BoxFit.fill,
                              image: data.profileImage == null
                                  ? const AssetImage('asset/filepicker.png')
                                      as ImageProvider<Object>
                                  : MemoryImage(imageBytes),
                            ),
                          ),
                        ),
                        title: Text(
                          data.name,
                          style: GoogleFonts.aDLaMDisplay(
                            fontSize: 22,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          data.location,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              itemCount: studentList.length,
            ),
          );
        },
      ),
    );
  }
}
