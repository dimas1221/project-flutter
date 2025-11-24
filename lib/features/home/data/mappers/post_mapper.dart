import '../../domain/entities/post_entity.dart';
import '../models/post_model.dart';
import '../../../../core/utils/mapper.dart';

class PostMapper extends Mapper<PostModel, PostEntity> {
  @override
  PostEntity map(PostModel input) {
    return PostEntity(id: input.id, title: input.title, body: input.body);
  }
}
