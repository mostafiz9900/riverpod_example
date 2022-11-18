import 'package:clean_arch/src/app.dart';
import 'package:clean_arch/src/domain/entities/student.dart';
import 'package:clean_arch/src/domain/entities/teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  print(dir.path);
  print('maion fun');
  isar = await Isar.open([StudentSchema, TeacherSchema],
      directory: dir.path, name: 'testdb');
  // listen to changes in the database

  runApp(const ProviderScope(child: MyApp()));
}
