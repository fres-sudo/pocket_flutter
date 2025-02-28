import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/widgets/profile_avatar.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(notAuthenticated: () {
          context.router.replaceAll([const WelcomeRoute()]);
        });
      },
      child: AutoTabsRouter(
        routes: const [HomeRoute(), ProfileRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.md),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (value) => tabsRouter.setActiveIndex(value),
                items: [
                  BottomNavigationBarItem(
                      activeIcon: const Icon(Icons.home_rounded), icon: const Icon(Icons.home_outlined), label: "Home"),
                  BottomNavigationBarItem(
                      icon: ProfileAvatar(
                        radius: 14,
                      ),
                      label: "Profile"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
