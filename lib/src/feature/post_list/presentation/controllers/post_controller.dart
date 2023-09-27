import 'dart:developer';

import 'package:flutter_clean_architecture/src/feature/post_list/domain/dtos/post_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/usecases/get_posts_usecase.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final GetPostsUseCase _getPostsUseCase;

  PostController(this._getPostsUseCase);

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  RxList<PostDTO> posts = <PostDTO>[].obs;

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
      posts.clear();
      var result = await _getPostsUseCase.execute();
      posts.addAll(result);
    } catch (e) {
      log('PostController exception => $e');
    } finally {
      isLoading.value = false;
    }
  }
}
