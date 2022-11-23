import 'dart:async';

import 'package:clean_arch/src/domain/entities/comment_entity.dart';
import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/about_controller.dart';

final isLoaderProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

class AboutView extends ConsumerWidget {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoader = ref.watch(isLoaderProvider);
    final homeData = ref.watch(userDataProvider);

    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        ref.read(isLoaderProvider.notifier).state = false;
        print('is losder if fase ');
      },
    );
    print(homeData.hashCode);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutView'),
      ),
      body: isLoader == true
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : homeData.when(
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text(error.toString())),
              data: (data) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.user.length,
                          itemBuilder: (context, index) {
                            var user = data.user.elementAt(index);
                            print(user.address);
                            return ListTile(title: Text(user.name.toString()));
                          },
                        ),
                      ),
                      Expanded(
                          // height: 200,
                          child: ListView.builder(
                        itemCount: data.photoList.length,
                        itemBuilder: (context, index) {
                          PhotoEntity user = data.photoList.elementAt(index);
                          return ListTile(title: Text(user.title.toString()));
                        },
                      )),
                      Expanded(
                          // height: 200,
                          child: ListView.builder(
                        itemCount: data.commentList.length,
                        itemBuilder: (context, index) {
                          CommentEntity user =
                              data.commentList.elementAt(index);
                          return ListTile(title: Text(user.name.toString()));
                        },
                      ))
                    ],
                  )),
    );
  }
}
