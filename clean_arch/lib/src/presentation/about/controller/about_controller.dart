import 'package:clean_arch/src/data/services/api_service.dart';
import 'package:clean_arch/src/domain/entities/comment_entity.dart';
import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/home_data.dart';

class AboutController {}

final userDataProvider =
    StateNotifierProvider.autoDispose<UserDataNotifier, AsyncValue<HomeData>>(
        (ref) => UserDataNotifier());

class UserDataNotifier extends StateNotifier<AsyncValue<HomeData>> {
  UserDataNotifier() : super(AsyncValue.loading()) {
    init();
  }
  final _api = ApiServices();

  void init() async {
    state = AsyncValue.loading();
    try {
      final List<UserEntity> userList = await _api.getUsers();
      final List<PhotoEntity> photoList = await _api.getPhotos();
      final List<CommentEntity> commentList = await _api.getComments();
      state = AsyncValue.data(HomeData(userList, photoList, commentList));
    } catch (e, stackTree) {
      state = AsyncValue.error(e, stackTree);
    }
  }
}
