import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome Page'),
          ElevatedButton(
            onPressed: () => context.router.push(const LoginRoute()),
            child: const Text('Go to Login'),
          ),
          ElevatedButton(
            onPressed: () => context.router.push(const SignupRoute()),
            child: const Text('Go to SignUp'),
          ),
        ],
      )),
    );
  }
}
