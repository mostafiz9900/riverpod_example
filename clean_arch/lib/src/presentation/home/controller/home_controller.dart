import 'package:clean_arch/src/domain/entities/student.dart';
import 'package:clean_arch/src/domain/entities/teacher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../main.dart';

final homeConProvider = Provider<HomeController>((ref) {
  return HomeController(ref: ref);
});

class HomeController {
  HomeController({required this.ref}) {
    _init();
  }
  Ref ref;
  void _init() async {
    // await addStudent();
    await getStudent();
    print('home controller init ');
  }

  Future<void> addStudent() async {
    final teacherAdd = Teacher()..subject = 'Fluter';
    final studentAdd = Student()
      ..name = 'Mostafizur Rahman'
      ..teacher.value = teacherAdd;

    await isar.writeTxn(() async {
      await isar.students.put(studentAdd); // insert & update
      await isar.teachers.put(teacherAdd);
      await studentAdd.teacher.save();
    });
  }

  Future<List<Student?>> getStudent() async {
    final data = isar.students;
    final allStudent = await data.where().findAll();
    return allStudent;
  }
}
