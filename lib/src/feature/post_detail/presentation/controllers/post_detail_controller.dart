import 'dart:developer';

import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/comment_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/post_detail_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/usecases/get_comments_by_post_id_usecase.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/usecases/get_post_by_id_usecase.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  final GetPostDetailByIdUseCase _getPostDetailByIdUseCase;
  final GetPostCommentsByPostIdUseCase _getPostCommentsByPostIdUseCase;

  PostDetailController(
    this._getPostDetailByIdUseCase,
    this._getPostCommentsByPostIdUseCase,
  );

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;
  late PostDetailDTO postDetail;
  List<CommentDTO> comments = <CommentDTO>[];
  var args = Get.arguments;

  @override
  void onInit() async {
    int postId = args['id'];
    await getPostDetailById(postId);
    await getPostCommentsByPostId(postId);
    super.onInit();
  }

  Future<void> getPostDetailById(int id) async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';

    try {
      postDetail = await _getPostDetailByIdUseCase.execute(id);
    } catch (e) {
      log('PostDetailController getPostDetailById() exception => $e');
      isError.value = true;
      errorMessage.value = '$e';
    }
  }

  Future<void> getPostCommentsByPostId(int postId) async {
    try {
      comments = await _getPostCommentsByPostIdUseCase.execute(postId);
    } catch (e) {
      log('PostDetailController getPostCommentsByPostId() exception => $e');
      isError.value = true;
      errorMessage.value = '$e';
    } finally {
      isLoading.value = false;
    }
  }
}
