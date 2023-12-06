import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/search_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      title == 'LIST OF STUDENT'
          ? IconButton(
              onPressed: () {
                log('working');
                Get.to(const SearchScreen());
              },
              icon: const Icon(Icons.search, size: 30),
            )
          : const Text(''),
    ],
    title: Text(
      title,
      style: GoogleFonts.roadRage(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 2,
      ),
    ),
    centerTitle: true,
  );
}
