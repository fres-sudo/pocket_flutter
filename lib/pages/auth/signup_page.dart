import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_flutter/ui/extensions.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'.hardcoded()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SignUp Page'.hardcoded()),
          ],
        ),
      ),
    );
  }
}
