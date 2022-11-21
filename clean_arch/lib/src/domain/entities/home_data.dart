import 'package:clean_arch/src/domain/entities/comment_entity.dart';
import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/entities/user_entity.dart';

class HomeData {
  final List<UserEntity> user;
  final List<PhotoEntity> photoList;
  final List<CommentEntity> commentList;
  HomeData(this.user, this.photoList, this.commentList);
}
