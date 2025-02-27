part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = InitialSignUpState;

  const factory SignUpState.loading() = LoadingSignUpState;

  const factory SignUpState.success() = SuccessSignUpState;

  const factory SignUpState.error(LocalizedError error) = ErrorSignUpState;
}
