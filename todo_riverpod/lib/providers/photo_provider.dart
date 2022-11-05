import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/services/api_service.dart';
import 'package:todo_riverpod/services/photo_service.dart';

import '../model/photo.dart';

class PhotoNotifier extends StateNotifier<List<PhotoModel>> {
  PhotoNotifier() : super([]) {
    loadPhoto();
  }

  Future<void> loadPhoto() async {
    final result = await PhotoServices().getPhotos();
    if (result != []) {
      state = result;
    }
  }

  List<PhotoModel> listOfData = [];
  void filterData(String data) async {
    listOfData.clear();
    if (data.isEmpty) {
      final result = await PhotoServices().getPhotos();
      state = result;
    } else {
      print(data);

      for (var userDetail in state) {
        if (userDetail.title!.toUpperCase().contains(data.toUpperCase())) {
          listOfData.add(userDetail);
        }
      }
      print(listOfData.length);
      state = listOfData;
    }
  }
}
