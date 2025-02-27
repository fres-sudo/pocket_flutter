import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_flutter/errors/generic_errors.dart';
import 'package:pocket_flutter/errors/localized.dart';
import 'package:pocket_flutter/repositories/auth_repository.dart';

part 'sign_up_bloc.freezed.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({
    required this.authRepository,
  }) : super(const SignUpState.initial()) {
    on<PerformSignUpEvent>(_onSignUp);
  }

  void signUp({
    required String email,
    required String password,
    required String name,
  }) =>
      add(SignUpEvent.perform(email: email, password: password, name: name));

  Future<void> _onSignUp(
    PerformSignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpState.loading());

    var isSuccess = false;
    try {
      await authRepository.signUp(
        email: event.email,
        password: event.password,
        name: event.name,
      );

      await authRepository.user.firstWhere((user) => user != null);

      isSuccess = true;
    } on LocalizedError catch (error) {
      emit(SignUpState.error(error));
    } catch (error) {
      emit(SignUpState.error(GenericError()));
    }

    if (isSuccess) {
      emit(const SignUpState.success());
    }
  }
}
