import 'dart:async';

import 'package:pine/pine.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocket_flutter/services/network/auth_service.dart';
import 'package:talker/talker.dart';

abstract class AuthRepository {
  /// Returns the currently authenticated [User]
  Stream<User?> get user;

  /// Perform the login with [email] and [password].
  Future<void> signIn({
    required String email,
    required String password,
  });

  /// Perform sign up procedure with [name],
  /// [email] and [password].
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  });

  /// Initiate a password reset procedure for the user linked by this [email].
  Future<void> resetPassword(String email);

  /// Perform the logout of the current user.
  void signOut();

  /// Perform to refresh session of the current logged user
  Future<void> refresh();

  /// Perform send email verification
  Future<void> sendEmailVerification(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final DTOMapper<UserDTO, User> userMapper;
  final Talker logger;

  const AuthRepositoryImpl({
    required this.authService,
    required this.userMapper,
    required this.logger,
  });

  @override
  Stream<User?> get user => authService.user.map((user) {
        return user == null ? null : userMapper.fromDTO(user);
      });

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      logger.info('[AuthRepository] Signing up user with email: $email');
      final dto = UserDTO(
          name: name,
          email: email,
          emailVisibility: true,
          created: DateTime.now(),
          updated: DateTime.now(),
          verified: true);
      await authService.signUp(dto: dto);
      logger.info('[AuthRepository] User signed up successfully with email: $email');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error signing up user with email: $email',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      logger.info('[AuthRepository] Signing in user with email: $email');
      await authService.signIn(email: email, password: password);
      logger.info('[AuthRepository] User signed in successfully with email: $email');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error signing in user with $email',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      logger.info(
        '[AuthRepository] Resetting password for user with the following parameters: {'
        'email: $email'
        '}',
      );
      await authService.resetPassword(email);
      logger.info('[AuthRepository] Password reset successfully for user with email: $email');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error resetting password for user with email: $email',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    logger.info('[AuthRepository] Performing sign out');
    authService.signOut();
    logger.info('[AuthRepository] Sign out successful');
  }

  @override
  Future<void> refresh() async {
    try {
      logger.info('[AuthRepository] Refreshing currnet user');
      await authService.refresh();
      logger.info('[AuthRepository] User refreshed successfully');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error refreshing user',
        error,
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification(String email) async {
    try {
      logger.info('[AuthRepository] Sending email verification to $email');
      await authService.sendEmailVerification(email);
      logger.info('[AuthRepository] Email verification sent successfully to $email');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error sending email verification to $email',
        error,
        stackTrace,
      );
      rethrow;
    }
  }
}
