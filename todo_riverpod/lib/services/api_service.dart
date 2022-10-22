import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/user.dart';

final apiServiceProvier = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<UserModel>> getUsers() async {
    try {
      final res = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      print(res.statusCode);
      if (res.statusCode == 200) {
        return userModelFromJson(res.data);
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error getting user');
    }
  }
}
