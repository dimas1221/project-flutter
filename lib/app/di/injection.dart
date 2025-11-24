import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjection() async {
  // Registrasi service contoh
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
