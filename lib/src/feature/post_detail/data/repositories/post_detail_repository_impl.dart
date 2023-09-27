import 'dart:developer';

import 'package:flutter_clean_architecture/src/feature/post_detail/data/datasources/post_detail_remote_datasource.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/comment_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/post_detail_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/repositories/post_detail_repository.dart';

class PostDetailRepositoryImpl implements PostDetailRepository {
  final PostDetailRemoteDataSource _dataSource;

  PostDetailRepositoryImpl(this._dataSource);

  @override
  Future<PostDetailDTO> getPostDetailById(int id) async {
    try {
      var result = await _dataSource.getPostDetailById(id);

      return PostDetailDTO.fromEntity(result);
    } catch (e) {
      log('PostDetailRepositoryImpl getPostDetailById() exception => $e');
      rethrow;
    }
  }

  @override
  Future<List<CommentDTO>> getCommentsByPostId(int postId) async {
    try {
      var result = await _dataSource.getCommentsByPostId(postId);
      List<CommentDTO> dtos = List.generate(result.length, (index) {
        return CommentDTO.fromEntity(result[index]);
      });

      return dtos;
    } catch (e) {
      log('PostDetailRepositoryImpl getCommentsByPostId() exception => $e');
      rethrow;
    }
  }
}
