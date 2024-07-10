import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  }
}
