import 'package:clean_arch/src/domain/entities/student.dart';
import 'package:clean_arch/src/domain/entities/teacher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    // await getStudent();
    print('home controller init ');
  }

  Future<void> addStudent() async {
    final teacherAdd = Teacher()
      ..id = 1
      ..subject = 'Fluter';
    final studentAdd = Student()
      ..id = 1
      ..name = 'Mostafizur';
    await isar.writeTxn(() async {
      await isar.teachers.put(teacherAdd); // insert & update
    });
    await isar.writeTxn(() async {
      await isar.students.put(studentAdd); // insert & update
    });
  }

  Future<List<Student?>> getStudent() async {
    final allStudent = await isar.students.getAll([
      1,
    ]);
    return allStudent;
  }
}
