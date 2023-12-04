import 'package:flutter/material.dart';

class BuildBotton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BuildBotton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 211, 20, 7),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
