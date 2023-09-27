import 'package:flutter_clean_architecture/src/feature/post_list/domain/dtos/post_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_list/domain/repositories/post_list_repository.dart';

class GetPostsUseCase {
  final PostListRepository _repository;

  GetPostsUseCase(this._repository);

  Future<List<PostDTO>> execute() async {
    return await _repository.getPosts();
  }
}
