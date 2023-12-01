import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: Colors.black,
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
