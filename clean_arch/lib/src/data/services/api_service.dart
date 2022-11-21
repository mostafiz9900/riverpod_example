import 'dart:convert';

import 'package:clean_arch/src/domain/entities/comment_entity.dart';
import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});

class ApiServices {
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

  Future<List<UserEntity>> getUsers() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return userEntityFromJson(response.body);
      }
    } catch (error) {
      print('get user data not fount $error');
    }
    return [];
  }

  Future<List<CommentEntity>> getComments() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/comments';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return commentEntityFromJson(response.body);
      }
    } catch (error) {
      print('get user data not fount $error');
    }
    return [];
  }
}
