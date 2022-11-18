import 'package:clean_arch/src/core/error/failures.dart';
import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:clean_arch/src/domain/repositories/api_repository.dart';
import 'package:dartz/dartz.dart';

class GetPhoto {
  final ApiRepository repository;
  GetPhoto(this.repository);
  Future<Either<Failure, PhotoEntity>> execute() async =>
      await repository.getPhotos();
}
