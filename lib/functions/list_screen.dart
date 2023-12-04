import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

listDismissFun({
  required data,
  required onPressedYes,
  required context,
  required onPressedNo,
}) {
  Get.defaultDialog(
      barrierDismissible: false,
      title: "Are you sure?",
      middleText: 'Sure to remove this student',
      titleStyle: GoogleFonts.roboto(
        color: Colors.black,
      ),
      middleTextStyle:
          GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.w600),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: onPressedYes,
          child: Text(
            'Yes',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        TextButton(
          onPressed: onPressedNo,
          child: Text(
            'No',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ]);
}
