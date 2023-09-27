import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/data/datasources/post_detail_remote_datasource.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/data/repositories/post_detail_repository_impl.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/repositories/post_detail_repository.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/usecases/get_comments_by_post_id_usecase.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/usecases/get_post_by_id_usecase.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/presentation/controllers/post_detail_controller.dart';
import 'package:get/get.dart';

class PostDetailBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();

    Get.lazyPut<PostDetailRemoteDataSource>(
      () => PostDetailRemoteDataSource(dio),
    );

    Get.lazyPut<PostDetailRepository>(
      () => PostDetailRepositoryImpl(Get.find<PostDetailRemoteDataSource>()),
    );

    Get.lazyPut<GetPostDetailByIdUseCase>(
      () => GetPostDetailByIdUseCase(Get.find<PostDetailRepository>()),
    );

    Get.lazyPut<GetPostCommentsByPostIdUseCase>(
      () => GetPostCommentsByPostIdUseCase(Get.find<PostDetailRepository>()),
    );

    Get.lazyPut<PostDetailController>(
      () => PostDetailController(
        Get.find<GetPostDetailByIdUseCase>(),
        Get.find<GetPostCommentsByPostIdUseCase>(),
      ),
    );
  }
}
