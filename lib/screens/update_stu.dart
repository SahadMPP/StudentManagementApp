import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/appbar_title.dart';
import 'package:flutter_application_2/widgets/textfiled.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Edit Deatiles'),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('asset/filepicker.png')),
            ),
            const SizedBox(height: 50),
            const TextFiledStu(
              hintText: 'Name',
              validatorText: 'Please enter name',
              prifixIcons: Icons.person,
            ),
            const SizedBox(height: 20),
            const TextFiledStu(
              hintText: 'Age',
              validatorText: 'Please enter age',
              prifixIcons: Icons.align_horizontal_center_outlined,
            ),
            const SizedBox(height: 20),
            const TextFiledStu(
              hintText: 'Guardian Name',
              validatorText: 'Please enter guardian name',
              prifixIcons: Icons.person_2,
            ),
            const SizedBox(height: 20),
            const TextFiledStu(
              hintText: 'Location',
              prifixIcons: Icons.location_on_outlined,
              validatorText: 'Please enter location',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 211, 20, 7),
                  ),
                ),
                child: const Text('UPDATE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
