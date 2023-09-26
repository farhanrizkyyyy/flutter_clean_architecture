import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/classes/failure.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/entities/post_entity.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/repositories/post_list_repository.dart';

class GetPostsUseCase {
  final PostListRepository _repository;

  GetPostsUseCase(this._repository);

  Future<Either<Failure, List<PostEntity>>> execute() async {
    return await _repository.getPosts();
  }
}
