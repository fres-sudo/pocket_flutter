import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pocket_flutter/di/dependency_injector.dart';
import 'package:pocket_flutter/i18n/strings.g.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/routes/app_router.dart';
import 'package:pocket_flutter/services/storage/local_storage.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  LocaleSettings.useDeviceLocale();

  final authStore = await FlutterSecureStorage().read(key: K.authStoreKey) ?? "";
  LocalStorage.instance.initialize(authStore);

  runApp(TranslationProvider(child: PocketFlutter()));
}

class PocketFlutter extends StatelessWidget {
  PocketFlutter({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
        child: MaterialApp.router(
            title: "Pocket Flutter",
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [AutoRouteObserver()],
            ),
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [],
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: Theme.of(context).copyWith(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
            )));
  }
}
