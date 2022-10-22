import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/user.dart';
import 'package:todo_riverpod/services/api_service.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvier);
  return apiService.getUsers();
});

class UserPage extends ConsumerWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRef = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('UserPage'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(userProvider.future),
        child: Center(
          child: userRef.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  UserModel user = data.elementAt(index);
                  return ListTile(
                      leading: CircleAvatar(child: Text(user.id.toString())),
                      title: Text(user.title.toString()),
                      subtitle: Text(user.body.toString()));
                },
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
