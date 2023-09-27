import 'package:flutter_clean_architecture/src/feature/post_detail/data/entities/comment_entity.dart';

class CommentDTO {
  int id;
  int postId;
  String name;
  String email;
  String body;

  CommentDTO({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentDTO.fromEntity(CommentEntity entity) => CommentDTO(
        id: entity.id,
        postId: entity.postId ?? 0,
        name: entity.name ?? '',
        email: entity.email ?? '',
        body: entity.body ?? '',
      );
}
