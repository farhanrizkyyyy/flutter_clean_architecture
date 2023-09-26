import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/classes/failure.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/entities/post_entity.dart';

abstract class PostListRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
