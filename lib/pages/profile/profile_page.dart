import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/state/cubits/package/package_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/extensions.dart';
import 'package:pocket_flutter/ui/widgets/destructive_bottom_sheet.dart';
import 'package:pocket_flutter/ui/widgets/profile_avatar.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'.hardcoded()),
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
                      ProfileAvatar(),
                      state.maybeWhen(
                        authenticated: (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: Theme.of(context).textTheme.titleLarge?.bold,
                            ),
                            Text(user.email,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    )),
                          ],
                        ),
                        orElse: () => Text('Not authenticated'.hardcoded()),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.lg),
                  FilledButton(
                    onPressed: () => context.router.push(const UpdateProfileRoute()),
                    child: Center(child: Text('Update Profile'.hardcoded())),
                  ),
                  TextButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => DestructiveBottomSheet(
                            title: "title",
                            buttonText: "buttonText",
                            description: "description",
                            onPress: () => context.read<AuthCubit>().signOut())),
                    child: Center(child: Text('Logout'.hardcoded())),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => DestructiveBottomSheet(
                            title: "title",
                            buttonText: "buttonText",
                            description: "description",
                            onPress: () => context.read<AuthCubit>().signOut())),
                    child: Center(child: Text('DeleteAccount'.hardcoded())),
                  ),
                  Spacer(),
                  Text(
                    "PocketFlutter Version: ${context.watch<PackageCubit>().state.version}".hardcoded(),
                    style: TextStyle().italic,
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
