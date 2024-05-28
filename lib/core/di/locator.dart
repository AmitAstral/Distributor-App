import 'package:distributor_empower/core/storage/storage.dart';
import 'package:distributor_empower/routes/navigation.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static void registerDi() {
    final getIt = GetIt.instance;
    //services
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
    getIt.registerLazySingleton<AppRouter>(() => AppRouter(navigatorKey: navigation.navigatorKey));
    getIt.registerLazySingleton<StorageService>(() => StorageService());
  }
}

final appContext = navigation.navigatorKey.currentContext!;
final navigation = GetIt.I<NavigationService>();
final appRouter = GetIt.I<AppRouter>();
final storage = GetIt.I<StorageService>();
