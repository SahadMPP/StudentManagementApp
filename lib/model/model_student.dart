import 'package:hive/hive.dart';
part 'model_student.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String gardian;
  @HiveField(4)
  final String location;
  @HiveField(5)
  final String? profileImage;

  StudentModel(
      {required this.name,
      required this.age,
      required this.gardian,
      required this.location,
      required this.profileImage,
      this.id});
}
