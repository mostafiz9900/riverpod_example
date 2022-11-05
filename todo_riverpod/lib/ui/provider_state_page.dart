import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_riverpod/model/photo.dart';
import 'package:todo_riverpod/providers/photo_provider.dart';
import 'package:todo_riverpod/ui/state_notify_page.dart';

import '../providers/random_num_state_provider.dart';

final photoNotifyProvider =
    StateNotifierProvider.autoDispose<PhotoNotifier, List<PhotoModel>>((ref) {
  return PhotoNotifier();
});
final isLoadPhotoProvider = StateProvider<bool>((ref) {
  return true;
});

class ProviderStatePage extends StatelessWidget {
  const ProviderStatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderStatePage'),
      ),
      body: Column(
        children: [
          const RandomConsumer(),
          Center(
            child: Text('ProviderStatePage'),
          ),
          Consumer(builder: (context, ref, child) {
            return ElevatedButton(
                onPressed: () {
                  ref.read(randomStateProvider.notifier).generate();
                },
                child: Text('Generate'));
          }),
          ElevatedButton(
              onPressed: () {
                context.go('/photo');
              },
              child: Text('Go To Photo Page')),
          SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                minLines: 1,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  ref.read(photoNotifyProvider.notifier).filterData(value);
                },
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          const PhotoConsumer(),
        ],
      ),
    );
  }
}

class RandomConsumer extends ConsumerWidget {
  const RandomConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(randomStateProvider).toString());
  }
}

class PhotoConsumer extends ConsumerWidget {
  const PhotoConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PhotoModel> photoList = ref.watch(photoNotifyProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          print(photoList.length);
          print('Ekhane ase');
          PhotoModel model = photoList.elementAt(index);
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Image.network(
                  model.thumbnailUrl.toString(),
                  fit: BoxFit.cover,
                )),
            title: Text(model.title.toString()),
          );
        },
      ),
    );
  }
}
