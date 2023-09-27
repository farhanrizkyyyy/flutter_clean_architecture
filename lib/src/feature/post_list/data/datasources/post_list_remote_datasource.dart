import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/constants/app_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/data/entities/post_entity.dart';

class PostListRemoteDataSource {
  final Dio _dio;

  PostListRemoteDataSource(this._dio);

  Future<List<PostEntity>> getPosts() async {
    // Anything that doing request to API is placed here in remote data source
    // Data source return either error or preffered Entity class (in this case List<PostEntity>)
    try {
      var response = await _dio.get('${AppConstant.baseUrl}/posts');
      var data = response.data;

      List<PostEntity> posts = List.generate(data.length, (index) {
        return PostEntity.fromJSON(data[index]);
      });

      return posts;
    } catch (e) {
      log('PostRemoteDataSource exception => $e');
      rethrow;
    }
  }
}
