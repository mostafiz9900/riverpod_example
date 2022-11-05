import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/photo.dart';

final photoService = Provider(
  (ref) => PhotoServices(),
);

class PhotoServices {
  Future<List<PhotoModel>> getPhotos() async {
    const String apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    try {
      Response response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        print(response.data);
        return photoModelFromJson(response.data);
      } else {
        return [];
      }
    } catch (error) {
      print('phonto list  error :  $error');
    }
    return [];
  }
}
