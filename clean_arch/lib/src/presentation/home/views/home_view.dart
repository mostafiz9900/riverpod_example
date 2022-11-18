import 'package:clean_arch/src/domain/entities/student.dart';
import 'package:clean_arch/src/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentProvider = FutureProvider<List<Student?>>((ref) async {
  final apiService = ref.watch(homeConProvider);
  return apiService.getStudent();
});

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sut = ref.watch(studentProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
        ),
        body: sut.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Student? student = data.elementAt(index);
                return Column(
                  children: [
                    Text(student?.name ?? ''),
                    Text(student?.teacher.value?.subject ?? 'no data'),
                  ],
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ));
  }
}
