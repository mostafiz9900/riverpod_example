import 'package:isar/isar.dart';
part "teacher.g.dart";

@collection
class Teacher {
  Id? id = Isar.autoIncrement;

  late String subject;
}
