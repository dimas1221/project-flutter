import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';
import '../mappers/post_mapper.dart';
import '../../../../core/utils/mapper.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remote;
  final PostMapper mapper = PostMapper();

  PostRepositoryImpl(this.remote);

  @override
  Future<List<PostEntity>> getPosts() async {
    final models = await remote.getPosts();
    return ListMapper(mapper).map(models);
  }
}
