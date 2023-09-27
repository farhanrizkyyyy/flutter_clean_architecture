import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/constants/app_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/data/entities/comment_entity.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/data/entities/post_detail_entity.dart';

class PostDetailRemoteDataSource {
  final Dio _dio;

  PostDetailRemoteDataSource(this._dio);

  Future<PostDetailEntity> getPostDetailById(int id) async {
    try {
      var response = await _dio.get('${AppConstant.baseUrl}/posts/$id');
      var data = response.data;

      return PostDetailEntity.fromJSON(data);
    } catch (e) {
      log('PostDetailRemoteRepository getPostById() exception => $e');
      rethrow;
    }
  }

  Future<List<CommentEntity>> getCommentsByPostId(int postId) async {
    try {
      var response =
          await _dio.get('${AppConstant.baseUrl}/posts/$postId/comments');
      var data = response.data;

      List<CommentEntity> comments = List.generate(data.length, (index) {
        return CommentEntity.fromJSON(data[index]);
      });

      return comments;
    } catch (e) {
      log('PostDetailRemoteRepository getCommentsByPostId() exception => $e');
      rethrow;
    }
  }
}
