import 'package:fitnest_x/model/user_model.dart';
import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
    getIt.registerLazySingleton<UserModel>(() => UserModel());
  }
}
