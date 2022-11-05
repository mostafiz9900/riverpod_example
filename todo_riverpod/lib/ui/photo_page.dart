import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/photo.dart';
import 'package:todo_riverpod/services/photo_service.dart';

final photoProvider = FutureProvider<List<PhotoModel>>((ref) async {
  final photos = ref.read(photoService);
  return photos.getPhotos();
});

class PhotoPage extends ConsumerWidget {
  const PhotoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoList = ref.watch(photoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoPage'),
      ),
      body: photoList.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            PhotoModel model = data.elementAt(index);
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
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
