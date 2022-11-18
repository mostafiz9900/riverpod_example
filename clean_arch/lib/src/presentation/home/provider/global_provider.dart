import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/usecases/get_photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalProvider extends ChangeNotifier {
  GlobalProvider({required this.getPhoto});
  final GetPhoto getPhoto;

  PhotoEntity photos = PhotoEntity();
  Future<void> getPhotoList() async {
    try {
      var resutl = await getPhoto.execute();
      photos = resutl.foldRight(PhotoEntity(), (r, previous) => r);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }
}
