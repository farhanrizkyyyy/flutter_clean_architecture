import 'package:flutter_clean_architecture/src/feature/post_detail/data/entities/post_detail_entity.dart';

class PostDetailDTO {
  int id;
  int userId;
  String title;
  String body;

  PostDetailDTO({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostDetailDTO.fromEntity(PostDetailEntity entity) => PostDetailDTO(
        id: entity.id,
        userId: entity.userId ?? 0,
        title: entity.title ?? '',
        body: entity.body ?? '',
      );
}
