import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_flutter/errors/generic_errors.dart';
import 'package:pocket_flutter/errors/localized.dart';
import 'package:pocket_flutter/repositories/auth_repository.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({
    required this.authRepository,
  }) : super(const SignInState.initial()) {
    on<PerformSignInEvent>(_onSignIn);
    /*on<SignInWithAppleEvent>(_onSignInWithApple);*/
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
  }

  void signInWithApple() => add(const SignInEvent.signInWithApple());

  void signInWithGoogle() => add(const SignInEvent.signInWithGoogle());

  void signIn({
    required String email,
    required String password,
  }) =>
      add(SignInEvent.signIn(
        email: email,
        password: password,
      ));

  Future<void> _onSignIn(
    PerformSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.loading());

    var isSuccess = false;
    try {
      await authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      await authRepository.user.firstWhere((user) => user != null);

      isSuccess = true;
    } on LocalizedError catch (error) {
      emit(SignInState.error(error));
    } catch (error) {
      emit(SignInState.error(GenericError()));
    }

    if (isSuccess) {
      emit(const SignInState.success());
    }
  }

/*
  FutureOr<void> _onSignInWithApple(
    event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.loading());

    var isSuccess = false;
    try {
      await authRepository.signInWithApple();

      await authRepository.user.firstWhere((user) => user != null);

      isSuccess = true;
    } on RepositoryError catch (error) {
      emit(SignInState.error(error));
    } catch (error) {
      emit(SignInState.error(GenericError()));
    }

    if (isSuccess) {
      emit(const SignInState.success());
    }
  }
*/

  FutureOr<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.loading());

    var isSuccess = false;
    try {
      //await authRepository.signInWithGoogle();

      await authRepository.user.firstWhere((user) => user != null);

      isSuccess = true;
    } on LocalizedError catch (error) {
      emit(SignInState.error(error));
    } catch (error) {
      emit(SignInState.error(GenericError()));
    }

    if (isSuccess) {
      emit(const SignInState.success());
    }
  }
}
