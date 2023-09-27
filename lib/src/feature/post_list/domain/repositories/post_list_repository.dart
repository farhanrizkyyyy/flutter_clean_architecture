import 'package:flutter_clean_architecture/src/feature/post_list/domain/dtos/post_dto.dart';

abstract class PostListRepository {
  Future<List<PostDTO>> getPosts();
}
