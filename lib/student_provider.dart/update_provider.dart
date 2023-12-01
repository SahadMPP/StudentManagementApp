import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProvider extends ChangeNotifier {
  File? seletedImage;

  Future imagecollect() async {
    final pikedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikedImage == null) {
      return;
    }

    seletedImage = File(pikedImage.path);
    notifyListeners();
  }
}
