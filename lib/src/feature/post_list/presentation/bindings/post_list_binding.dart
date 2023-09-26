import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/data/datasource/remotes/post_list_remote_datasource.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/data/repositories/post_list_repository_impl.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/repositories/post_list_repository.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/presentation/controllers/post_list_controller.dart';
import 'package:get/get.dart';

class PostListBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();

    Get.lazyPut<PostListRemoteDataSource>(
      () => PostListRemoteDataSource(dio),
    );

    Get.lazyPut<PostListRepository>(
      () => PostListRepositoryImpl(Get.find<PostListRemoteDataSource>()),
    );

    Get.lazyPut<GetPostsUseCase>(
      () => GetPostsUseCase(Get.find<PostListRepository>()),
    );

    Get.lazyPut<PostListController>(
      () => PostListController(Get.find<GetPostsUseCase>()),
    );
  }
}
