import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocket_flutter/routes/app_router.gr.dart';
import 'package:pocket_flutter/state/blocs/sign_in/sign_in_bloc.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/widgets/loading_spinner.dart';
import 'package:pocket_flutter/ui/widgets/snack_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignInBloc(
          authRepository: context.read(),
        ),
        child: this,
      );

  static const String kFormEmail = "email";
  static const String kFormPassword = "password";

  FormGroup buildForm() => fb.group(<String, Object>{
        kFormEmail: FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        kFormPassword: FormControl<String>(validators: [Validators.required, Validators.minLength(8)]),
      });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) => state.whenOrNull(
        success: () => context.router.replaceAll([const HomeRoute()]),
        error: (error) => showSnackBar(context, message: error.localizedString(context), type: SnackBarType.error),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(Sizes.responsiveInsets(context)),
            child: ReactiveFormBuilder(
                form: () => buildForm(),
                builder: (context, form, child) => Column(
                      spacing: Sizes.edgeInsetsPhone,
                      children: [
                        ReactiveTextField<String>(
                          formControlName: kFormEmail,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        ReactiveTextField<String>(
                          formControlName: kFormPassword,
                          decoration: const InputDecoration(labelText: 'Password'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (form.valid) {
                              context.read<SignInBloc>().signIn(
                                  email: form.value[kFormEmail].toString(),
                                  password: form.value[kFormPassword].toString());
                            } else {
                              showSnackBar(context, message: 'Please correct the errors', type: SnackBarType.error);
                              form.markAllAsTouched();
                            }
                          },
                          child: BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) => state.maybeWhen(
                                  orElse: () => Center(child: const Text('Login')),
                                  loading: () => const LoadingSpinner())),
                        ),
                      ],
                    )),
          ))),
    );
  }
}
