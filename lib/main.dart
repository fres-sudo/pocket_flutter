import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocket_flutter/di/dependency_injector.dart';
import 'package:pocket_flutter/i18n/strings.g.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/routes/app_router.dart';
import 'package:pocket_flutter/services/local/package_service.dart';
import 'package:pocket_flutter/services/storage/local_storage.dart';
import 'package:pocket_flutter/state/cubits/theme/theme_cubit.dart';
import 'package:pocket_flutter/ui/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  LocaleSettings.useDeviceLocale();

  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  final authStore = await FlutterSecureStorage().read(key: K.authStoreKey) ?? "";
  LocalStorage.instance.initialize(authStore);

  runApp(TranslationProvider(child: PocketFlutter()));
}

class PocketFlutter extends StatelessWidget {
  PocketFlutter({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
      return MaterialApp.router(
        title: "Pocket Flutter",
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: PocketFlutterTheme().light,
        darkTheme: PocketFlutterTheme().dark,
        themeMode: state,
      );
    }));
  }
}
