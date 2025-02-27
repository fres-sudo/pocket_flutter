import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_flutter/repositories/auth_repository.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordBloc({
    required this.authRepository,
  }) : super(const ResetPasswordState.initial()) {
    on<LoadResetPasswordEvent>(_onReset);
  }

  Future<void> _onReset(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(const ResetPasswordState.loading());

    try {
      await authRepository.resetPassword(event.email);
    } catch (error) {
      // Skip error due to security policy
    }

    emit(const ResetPasswordState.success());
  }

  void reset(String email) => add(ResetPasswordEvent.reset(email));
}
