import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/services/local/package_service.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/state/cubits/package/package_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/extensions.dart';
import 'package:pocket_flutter/ui/widgets/profile_picutre.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Sizes.responsiveInsets(context)),
            child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: Sizes.lg,
                  ),
                  Row(
                    spacing: Sizes.lg,
                    children: [
                      ProfilePicutre(),
                      state.maybeWhen(
                        authenticated: (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: Theme.of(context).textTheme.titleLarge?.bold,
                            ),
                            Text(user.email),
                          ],
                        ),
                        orElse: () => const Text('Not authenticated'),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.lg),
                  FilledButton(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    child: Center(child: const Text('Update Profile')),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    child: Center(child: const Text('Logout')),
                  ),
                  TextButton(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    child: Center(child: const Text('Delete Account')),
                  ),
                  Spacer(),
                  Text(
                    "PocketFlutter Version: ${context.read<PackageCubit>().state.version}",
                    style: TextStyle().italic,
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
