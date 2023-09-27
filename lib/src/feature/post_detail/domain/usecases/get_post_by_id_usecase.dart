import 'package:flutter_clean_architecture/src/feature/post_detail/domain/dtos/post_detail_dto.dart';
import 'package:flutter_clean_architecture/src/feature/post_detail/domain/repositories/post_detail_repository.dart';

class GetPostDetailByIdUseCase {
  final PostDetailRepository _repository;

  GetPostDetailByIdUseCase(this._repository);

  Future<PostDetailDTO> execute(int id) async {
    return await _repository.getPostDetailById(id);
  }
}
