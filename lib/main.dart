import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/screens/spalsh_screen.dart';
import 'package:flutter_application_2/student_provider.dart/add_students.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.isAdapterRegistered(StudentModelAdapter().typeId);
  Hive.registerAdapter(StudentModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddStuProvider>(create: (_) => AddStuProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const SpashScreen(),
      ),
    );
  }
}
