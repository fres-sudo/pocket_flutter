import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/state/blocs/user/user_bloc.dart';
import 'package:pocket_flutter/state/cubits/auth/auth_cubit.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/extensions.dart';
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
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) => state.whenOrNull(
        updated: (_) {
          showSnackBar(context, message: 'Profile updated successfully'.hardcoded(), type: SnackBarType.success);
          context.router.maybePop();
        },
        errorUpdating: (error) =>
            showSnackBar(context, message: error.localizedString(context), type: SnackBarType.error),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Update Profile'.hardcoded())),
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
                        decoration: InputDecoration(
                          labelText: 'Name'.hardcoded(),
                        )),
                    ReactiveTextField<String>(
                      formControlName: kFormEmail,
                      decoration: InputDecoration(labelText: 'Email'.hardcoded()),
                    ),
                    const Spacer(),
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                      return FilledButton(
                        onPressed: state.maybeWhen(updating: () => false, orElse: () => true)
                            ? () {
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
                                  showSnackBar(context,
                                      message: 'Please fill in all fields'.hardcoded(), type: SnackBarType.error);
                                  formGroup.markAllAsTouched();
                                }
                              }
                            : null,
                        child: Center(child: Text('Update'.hardcoded())),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
