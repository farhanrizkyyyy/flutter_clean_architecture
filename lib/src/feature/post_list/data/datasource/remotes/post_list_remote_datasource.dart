import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/classes/failure.dart';
import 'package:flutter_clean_architecture/src/core/constants/app_constant.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/data/dtos/post_dto.dart';

class PostListRemoteDataSource {
  final Dio _dio;

  PostListRemoteDataSource(this._dio);

  Future<Either<Failure, List<PostDTO>>> getPosts() async {
    // Anything that doing request to API is placed here in remote data source
    // Data source return either error or preffered DTO class (in this case List<PostDTO>)
    try {
      var response = await _dio.get('${AppConstant.baseUrl}/posts');
      var data = response.data;

      List<PostDTO> dtos = List.generate(data.length, (index) {
        return PostDTO.fromJSON(data[index]);
      });

      return Right(dtos);
    } catch (e) {
      log('PostListRemoteDataSource exception => $e');
      return Left(Failure('$e'));
    }
  }
}
