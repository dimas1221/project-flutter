import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class GetPostsUsecase {
  final PostRepository repo;

  GetPostsUsecase(this.repo);

  Future<List<PostEntity>> call() async {
    return await repo.getPosts();
  }
}
