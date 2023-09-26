import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/classes/failure.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/data/datasource/remotes/post_list_remote_datasource.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/entities/post_entity.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/repositories/post_list_repository.dart';

class PostListRepositoryImpl extends PostListRepository {
  final PostListRemoteDataSource _dataSource;

  PostListRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    // This class is used for getting result from remote/local data source (DTO class)
    // and map its result to entity class (in this case List<PostEntity>)
    try {
      List<PostEntity> posts = <PostEntity>[];
      var result = await _dataSource.getPosts();

      result.fold(
        (l) => throw Exception(),
        (r) => posts = List.generate(r.length, (index) {
          return PostEntity.fromDTO(r[index]);
        }),
      );

      return Right(posts);
    } catch (e) {
      log('PostListRepositoryImpl exception => $e');
      return Left(Failure('$e'));
    }
  }
}
