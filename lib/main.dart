import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/storage/storage_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/init.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(box);

  await Future.delayed(const Duration(milliseconds: 300));

  Locator.registerDi();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            scaffoldMessengerKey: Init().scaffoldMessengerKey,
            routerDelegate: AppRouter().delegate(),
            routeInformationParser: AppRouter().defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [AppLocalizationDelegate()],
            supportedLocales: const AppLocalizationDelegate().supportedLocales,
            locale: const Locale('en'),
            //changeLangNotifier.currentLang,
          );
        });
  }
}
