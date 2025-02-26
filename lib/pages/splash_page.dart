import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/pages/_widgets/loading_spinner.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
            authenticated: (_) => context.router.replaceAll([const RootRoute()]),
            notAuthenticated: () => context.router.replaceAll([const WelcomeRoute()]));
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: K.lg,
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
