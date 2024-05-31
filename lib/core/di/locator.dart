import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/api/api_service.dart';
import 'package:distributor_empower/core/storage/storage.dart';
import 'package:distributor_empower/routes/navigation.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static void registerDi() {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
  }
}

final appContext = AppRouter().navigatorKey.currentContext!;
final navigation = GetIt.I<NavigationService>();
final appRouter = AutoRouter.of(appContext);
final storage = GetIt.I<StorageService>();
final apiService = GetIt.I<ApiService>();
