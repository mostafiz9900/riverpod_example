import 'package:clean_arch/src/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/about_controller.dart';

class AboutView extends ConsumerWidget {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(userDataProvider);
    print(homeData.hashCode);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutView'),
      ),
      body: homeData.when(
          loading: () => CircularProgressIndicator(),
          error: (error, _) => Center(child: Text(error.toString())),
          data: (data) => Center(child: ListView.builder(
                itemBuilder: (context, index) {
                  UserEntity user = data.user.elementAt(index);
                  return Text(user.name.toString());
                },
              ))),
    );
  }
}
