part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = LoadingAuthState;

  const factory AuthState.authenticated(User user) = AuthenticatedAuthState;

  const factory AuthState.notAuthenticated() = NotAuthenticatedAuthState;
}
