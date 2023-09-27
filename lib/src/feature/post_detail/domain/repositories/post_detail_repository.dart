import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/comment_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/post_detail_dto.dart';

abstract class PostDetailRepository {
  Future<PostDetailDTO> getPostDetailById(int id);
  Future<List<CommentDTO>> getCommentsByPostId(int postId);
}
