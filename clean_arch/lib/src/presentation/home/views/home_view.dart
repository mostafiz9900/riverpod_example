import 'package:clean_arch/src/domain/entities/student.dart';
import 'package:clean_arch/src/presentation/about/views/about_view.dart';
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
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutView())),
              icon: Icon(Icons.abc_outlined))
        ],
      ),
      body: sut.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Student? student = data.elementAt(index);
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${student?.id}'),
                ),
                title: Text(student?.name ?? ''),
                subtitle: Text(student?.teacher.value?.subject ?? 'no data'),
                trailing: IconButton(
                    onPressed: () {
                      ref.read(homeConProvider).deleteTodo(student?.id ?? 0);
                    },
                    icon: CircleAvatar(child: Icon(Icons.remove))),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            ref.read(homeConProvider).addStudent('Showpan', 'CA');
            // ref.read(homeConProvider).getStudent();
            ref.refresh(studentProvider);
            // await ref.read(studentProvider.future);
          },
          child: Icon(Icons.add)),
    );
  }
}
