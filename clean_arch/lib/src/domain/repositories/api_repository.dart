import 'package:clean_arch/src/domain/entities/photo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/failures.dart';

abstract class ApiRepository {
  Future<Either<Failure, PhotoEntity>> getPhotos();
}
