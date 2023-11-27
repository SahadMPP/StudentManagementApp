import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

getprofile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 37, 37),
        borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: const Color.fromARGB(255, 143, 141, 141),
        ),
      ),
      leading: Icon(iconData, size: 30),
    ),
  );
}
