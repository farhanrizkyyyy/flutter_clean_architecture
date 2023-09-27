import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/comment_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/repositories/post_detail_repository.dart';

class GetPostCommentsByPostIdUseCase {
  final PostDetailRepository _repository;

  GetPostCommentsByPostIdUseCase(this._repository);

  Future<List<CommentDTO>> execute(int postId) async {
    return await _repository.getCommentsByPostId(postId);
  }
}
