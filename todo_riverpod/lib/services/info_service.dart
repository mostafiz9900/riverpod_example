import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/info.dart';

final infoServiceProvider = Provider<InfoService>((ref) {
  return InfoService();
});

class InfoService {
  Future<List<InfoModel>> getInfoList() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/comments';
    try {
      Response response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        return infoModelFromJson(response.data);
      } else {
        return [];
      }
    } catch (error) {
      print('info data not found $error');
      return [];
    }
  }
}
