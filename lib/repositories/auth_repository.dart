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

  /// Perform sign up procedure putting [name],
  /// [email] and [newPassword].
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  });

  /// Initiate a password reset procedure for the user linked by this [email].
  Future<void> resetPassword(String email);

  /// Perform the logout of the current user.
  Future<void> signOut();

  /// Perform to reload user
  Future<void> reload();

  /// Perform send email verification
  Future<void> sendEmailVerification(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final DTOMapper<UserDTO, User> userMapper;
  final Talker logger;

  AuthRepositoryImpl({
    required this.authService,
    required this.userMapper,
    required this.logger,
  }) {
    logger.info('[AuthRepository] Created');
    authService.user.listen((user) {
      logger.info('[AuthRepository] User changed: $user');
    });
  }

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
      logger.info(
        '[AuthRepository] Signing up user with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
      );
      final dto = UserDTO(
          name: name,
          email: email,
          emailVisibility: true,
          created: DateTime.now(),
          updated: DateTime.now(),
          verified: true);
      await authService.signUp(dto: dto);
      logger.info(
        '[AuthRepository] User signed up successfully with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
      );
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error signing up user with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
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
      logger.info(
        '[AuthRepository] Signing in user with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
      );
      await authService.signIn(email: email, password: password);
      logger.info(
        '[AuthRepository] User signed in successfully with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
      );
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error signing in user with the following parameters: {'
        'email: $email, '
        'password: $password'
        '}',
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
      logger.info(
        '[AuthRepository] Password reset successfully for user with the following parameters: {'
        'email: $email'
        '}',
      );
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error resetting password for user with the following parameters: {'
        'email: $email'
        '}',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      logger.info('[AuthRepository] Performing signOut');
      await authService.signOut();
      logger.info('[AuthRepository] SignOut successful');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error performing signOut',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> reload() async {
    try {
      logger.info('[AuthRepository] Reloading user');
      await authService.reload();
      logger.info('[AuthRepository] User reloaded successfully');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error reloading user',
        error,
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification(String email) async {
    try {
      logger.info('[AuthRepository] Sending email verification');
      await authService.sendEmailVerification(email);
      logger.info('[AuthRepository] Email verification sent successfully');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthRepository] Error sending email verification',
        error,
        stackTrace,
      );
      rethrow;
    }
  }
}
