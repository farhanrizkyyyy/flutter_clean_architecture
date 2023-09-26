import 'package:flutter_clean_architecture/src/feature/post_list/data/dtos/post_dto.dart';

class PostEntity {
  int id;
  int userId;
  String title;
  String body;

  PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostEntity.fromDTO(PostDTO dto) => PostEntity(
        id: dto.id ?? 0,
        userId: dto.userId ?? 0,
        title: dto.title ?? '',
        body: dto.body ?? '',
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
