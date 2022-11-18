import 'package:clean_arch/src/domain/entities/teacher.dart';
import 'package:isar/isar.dart';
part 'student.g.dart';

@collection
class Student {
  Id? id;

  late String name;

  final teacher = IsarLink<Teacher>();
}
