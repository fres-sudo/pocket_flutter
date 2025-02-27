import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/widgets/loading_spinner.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
            authenticated: (_) => context.router.replaceAll([const HomeRoute()]),
            notAuthenticated: () => context.router.replaceAll([const WelcomeRoute()]));
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Sizes.md,
          children: [
            Center(
                child: Text(
              "Pocket Flutter",
              style: Theme.of(context).textTheme.headlineMedium,
            )),
            const LoadingSpinner()
          ],
        ),
      ),
    );
  }
}
