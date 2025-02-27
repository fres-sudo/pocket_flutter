import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: SplashRoute.page,
          fullscreenDialog: true,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: WelcomeRoute.page,
          fullscreenDialog: true,
        ),
        AutoRoute(page: RootRoute.page, children: [
          CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            page: HomeRoute.page,
            fullscreenDialog: true,
          ),
          CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            page: ProfileRoute.page,
            fullscreenDialog: true,
          ),
        ]),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: UpdateProfileRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: LoginRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: SignupRoute.page,
        ),
      ];
}
