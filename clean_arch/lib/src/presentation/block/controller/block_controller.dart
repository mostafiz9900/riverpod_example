import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/services/api_service.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/entities/photo_entity.dart';
import '../../../domain/entities/user_entity.dart';

final userProvider = FutureProvider.autoDispose<List<UserEntity>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getUsers();
});
final photoProvider =
    FutureProvider.autoDispose<List<PhotoEntity>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getPhotos();
});
final commentProvider =
    FutureProvider.autoDispose<List<CommentEntity>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getComments();
});

final isloadProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});
