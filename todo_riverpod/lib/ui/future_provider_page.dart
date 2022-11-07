import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/info.dart';
import 'package:todo_riverpod/providers/info_provider.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var infoData = ref.watch(infoProvider('9900'));
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('FutureProviderPage'),
      ),
      body: infoData.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            InfoModel model = data.elementAt(index);
            return ListTile(
              title: Text(model.name ?? ''),
              subtitle: Text(model.email ?? ''),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
