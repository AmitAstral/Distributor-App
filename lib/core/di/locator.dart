import 'package:distributor_empower/core/api/api_repositry.dart';
import 'package:distributor_empower/core/api/api_service.dart';
import 'package:distributor_empower/core/storage/storage.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static void registerDi() {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<ApiRepository>(() => ApiRepository());
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  }
}

final appRouter = GetIt.I<AppRouter>();
final appContext = AppRouter().navigatorKey.currentContext!;
final storage = GetIt.I<StorageService>();
final apiService = GetIt.I<ApiService>();
