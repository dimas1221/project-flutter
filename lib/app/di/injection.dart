import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/post_remote_datasource.dart';
import '../../features/home/data/repositories/post_repository_impl.dart';
import '../../features/home/domain/repositories/post_repository.dart';
import '../../features/home/domain/usecases/get_posts_usecase.dart';
import '../../features/home/presentation/controllers/post_controller.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  // 🔥 REGISTER DIO DULU
  sl.registerLazySingleton<Dio>(() => Dio());

  // DATA SOURCE
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(sl()),
  );

  // REPOSITORY
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));

  // USECASE
  sl.registerLazySingleton<GetPostsUsecase>(() => GetPostsUsecase(sl()));

  // CONTROLLER
  sl.registerFactory<PostController>(() => PostController(sl()));
}
