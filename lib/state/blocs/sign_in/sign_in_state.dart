part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = InitialSignInState;

  const factory SignInState.loading() = LoadingSignInState;

  const factory SignInState.success() = SuccessSignInState;

  const factory SignInState.error(LocalizedError error) = ErrorSignInState;
}
