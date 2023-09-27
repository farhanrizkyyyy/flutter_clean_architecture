import 'package:flutter_clean_architecture/src/feature/post_list/data/entities/post_entity.dart';

class PostDTO {
  int id;
  int userId;
  String title;
  String body;

  PostDTO({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostDTO.fromEntity(PostEntity entity) => PostDTO(
        id: entity.id,
        userId: entity.userId ?? 0,
        title: entity.title ?? '',
        body: entity.body ?? '',
      );
}
