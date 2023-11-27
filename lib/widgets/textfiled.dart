import 'package:flutter/material.dart';

class TextFiledStu extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String validatorText;
  final IconData prifixIcons;

  const TextFiledStu({
    super.key,
    required this.hintText,
    required this.controller,
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
          prefixIconColor: const Color.fromARGB(255, 46, 46, 46),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
