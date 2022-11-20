import 'dart:convert';

import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<UserEntity>> getUser() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return userEntityFromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print('get user data not fount $error');
    }
    return [];
  }

  Future<List<PhotoEntity>> getPhotos() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return photoEntityFromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print('get user data not fount $error');
    }
    return [];
  }
}
