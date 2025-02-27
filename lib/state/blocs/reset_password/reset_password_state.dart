part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = InitialResetPasswordState;

  const factory ResetPasswordState.loading() = LoadingResetPasswordState;

  const factory ResetPasswordState.success() = SuccessResetPasswordState;
}
