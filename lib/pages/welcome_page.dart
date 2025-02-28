import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/ui/extensions.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'.hardcoded()),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome Page'.hardcoded()),
          ElevatedButton(
            onPressed: () => context.router.push(const LoginRoute()),
            child: Text('Go to Login'.hardcoded()),
          ),
          ElevatedButton(
            onPressed: () => context.router.push(const SignupRoute()),
            child: Text('Go to SignUp'.hardcoded()),
          ),
        ],
      )),
    );
  }
}
