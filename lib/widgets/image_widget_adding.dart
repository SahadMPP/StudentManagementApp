import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/student_provider.dart/add_update.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  final XFile? imageFile;
  final VoidCallback onPressedCam;
  final VoidCallback onPressedGal;

  const ImageWidget({
    super.key,
    this.imageFile,
    required this.onPressedCam,
    required this.onPressedGal,
  });

  @override
  Widget build(BuildContext context) {
    final addListProvider = Provider.of<AddAndUpdate>(context);

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: addListProvider.imageFile == null
                ? const AssetImage('asset/filepicker.png')
                    as ImageProvider<Object>
                : FileImage(
                    File(addListProvider.imageFile!.path),
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Get.showSnackbar(GetSnackBar(
                  titleText: Text(
                    'Choose Profile photo',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  messageText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: onPressedCam,
                        child: Text(
                          'Camera',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: onPressedGal,
                        child: Text(
                          'Gallery',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  duration: const Duration(seconds: 10),
                  dismissDirection: DismissDirection.down,
                ));
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
