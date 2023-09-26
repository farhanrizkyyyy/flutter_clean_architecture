import 'dart:developer';

import 'package:flutter_clean_architecture/src/feature/post_list/domain/entities/post_entity.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/usecases/get_posts_usecase.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  final GetPostsUseCase _getPostsUseCase;

  PostListController(this._getPostsUseCase);

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  RxList<PostEntity> posts = <PostEntity>[].obs;

  @override
  void onInit() async {
    await getPosts();
    super.onInit();
  }

  Future<void> getPosts() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';

    try {
      var result = await _getPostsUseCase.execute();

      result.fold(
        (l) {
          isError.value = true;
          errorMessage.value = l.message;
          throw Exception();
        },
        (r) {
          posts.clear();
          posts.addAll(r);
        },
      );
    } catch (e) {
      log('PostListController exception => $e');
    } finally {
      isLoading.value = false;
    }
  }
}
