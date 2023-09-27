import 'dart:developer';

import 'package:flutter_clean_architecture/src/feature/post_list/data/datasources/post_list_remote_datasource.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/dtos/post_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/repositories/post_list_repository.dart';

class PostListRepositoryImpl extends PostListRepository {
  final PostListRemoteDataSource _dataSource;

  PostListRepositoryImpl(this._dataSource);

  @override
  Future<List<PostDTO>> getPosts() async {
    // This class is used for getting result from remote/local data source (Entity class)
    // and map its result to DTO class (in this case List<PostDTO>)
    try {
      var result = await _dataSource.getPosts();
      List<PostDTO> posts = List.generate(result.length, (index) {
        return PostDTO.fromEntity(result[index]);
      });

      return posts;
    } catch (e) {
      log('PostRepositoryImpl exception => $e');
      rethrow;
    }
  }
}
