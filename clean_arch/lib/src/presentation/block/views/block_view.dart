import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/block_controller.dart';

class BlockView extends ConsumerWidget {
  const BlockView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final isLoader = ref.watch(isloadProvider);
    final users = ref.watch(userProvider);
    print('one =========');
    final photos = ref.watch(photoProvider);
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        print('done ');
      },
    );
    print('two =========');
    final comment = ref.watch(commentProvider);
    print('three =========');

    Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        ref.read(isloadProvider.notifier).state = false;
      },
    );
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('BlockView'),
          leading: IconButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              icon: Icon(Icons.backspace)),
        ),
        body: isLoader == true
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: users.when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(data.elementAt(index).name.toString()),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const Text(''),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: photos.when(
                      data: (pData) {
                        return ListView.builder(
                          itemCount: pData.length,
                          itemBuilder: (context, pindex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  pData.elementAt(pindex).title.toString()),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const Text(''),
                    ),
                  ),
                  Expanded(
                    child: comment.when(
                      data: (cData) {
                        return ListView.builder(
                          itemCount: cData.length,
                          itemBuilder: (context, cindex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(cData.elementAt(cindex).body.toString()),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const Text(''),
                    ),
                  ),
                ],
              ));
  }
}
