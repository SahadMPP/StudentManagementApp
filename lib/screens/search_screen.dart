import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider/add_students.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<AddStuProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
        title: TextField(
          onChanged: (value) => studentProvider.runFilter(value),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Search here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<AddStuProvider>(
          builder: (context, studentProvider, child) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = studentProvider.foundUser[index];
                final String bytes = data.profileImage;
                final imageBytes = base64.decode(bytes);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 23, 23, 23),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          height: 65,
                          width: 60,
                          child: Image(
                            image: MemoryImage(imageBytes),
                            fit: BoxFit.fill,
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
                    ),
                  ),
                );
              },
              itemCount: studentProvider.foundUser.length,
            );
          },
        ),
      ),
    );
  }
}
