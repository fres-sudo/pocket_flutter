import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/state/blocs/user/user_bloc.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/widgets/snack_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  static const String kFormName = 'name';
  static const String kFormEmail = 'email';

  FormGroup buildForm(BuildContext context) {
    final user = context.read<AuthCubit>().state.maybeWhen(
          authenticated: (user) => user,
          orElse: () => null,
        );

    return fb.group({
      kFormName: FormControl<String>(
        value: user?.name,
        validators: [Validators.required],
      ),
      kFormEmail: FormControl<String>(
        value: user?.email,
        validators: [Validators.required, Validators.email],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Update Profile')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Sizes.responsiveInsets(context)),
          child: ReactiveFormBuilder(
            form: () => buildForm(context),
            builder: (context, formGroup, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: Sizes.lg,
                children: [
                  const SizedBox(),
                  ReactiveTextField<String>(
                    formControlName: kFormName,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  ReactiveTextField<String>(
                    formControlName: kFormEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () {
                      if (formGroup.valid) {
                        if (formGroup.dirty) {
                          context.read<AuthCubit>().state.whenOrNull(
                              authenticated: (user) => context.read<UserBloc>().updateUser(
                                    user: user.copyWith(
                                      name: formGroup.control(kFormName).value,
                                      email: formGroup.control(kFormEmail).value,
                                    ),
                                  ));
                        } else {
                          context.router.maybePop();
                        }
                      } else {
                        showSnackBar(context, message: 'Please fill in all fields', type: SnackBarType.error);
                        formGroup.markAllAsTouched();
                      }
                    },
                    child: Center(child: const Text('Update')),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
