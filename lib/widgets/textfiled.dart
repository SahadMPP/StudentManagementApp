import 'package:flutter/material.dart';

class TextFiledStu extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String validatorText;
  final IconData prifixIcons;
  const TextFiledStu({
    super.key,
    required this.hintText,
    this.controller,
    required this.validatorText,
    required this.prifixIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 62, 61, 61),
            fontSize: 17,
            letterSpacing: .5,
          ),
          prefixIcon: Icon(prifixIcons, size: 28),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
