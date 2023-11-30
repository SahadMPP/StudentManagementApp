import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/model_student.dart';
import 'package:flutter_application_2/screens/update_stu.dart';
import 'package:flutter_application_2/student_provider.dart/add_update.dart';
import 'package:flutter_application_2/student_provider.dart/list_note.dart';
import 'package:flutter_application_2/student_provider.dart/update_provider.dart';
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
        ChangeNotifierProvider<ListNotifier>(create: (_) => ListNotifier()),
        ChangeNotifierProvider<AddAndUpdate>(create: (_) => AddAndUpdate()),
        // ChangeNotifierProvider<UpdateProvider>(create: (_) => UpdateProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.black),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 46, 46, 46)),
        ),
        home: const UpdateScreen(),
      ),
    );
  }
}
