import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocket_flutter/errors/auth_errors.dart';
import 'package:pocket_flutter/errors/generic_errors.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:talker/talker.dart';

/// Service responsible for handling authentication-related operations.
///
/// This service provides methods to:
/// * Monitor authenticated user state
/// * Sign in users with email and password
/// * Register new users
/// * Handle password reset
/// * Manage user sessions
/// * Email verification
abstract class AuthService {
  /// Stream that emits the currently authenticated user.
  ///
  /// Emits [UserDTO] when a user is authenticated, null otherwise.
  Stream<UserDTO?> get user;

  /// Authenticates a user using email and password credentials.
  ///
  /// Takes [email] and [password] as required parameters.
  /// Throws an exception if authentication fails.
  Future<void> signIn({
    required String email,
    required String password,
  });

  /// Creates a new user account with the provided information.
  ///
  /// Takes [dto] containing user registration data.
  /// Throws an exception if registration fails.
  Future<void> signUp({required UserDTO dto});

  /// Initiates password reset procedure for a user.
  ///
  /// Takes user's [email] address.
  /// Sends password reset instructions to the provided email.
  Future<void> resetPassword(String email);

  /// Signs out the currently authenticated user.
  ///
  /// Clears all authentication tokens and user session data.
  void signOut();

  /// Refreshes the current user's authentication state.
  ///
  /// Updates user information and authentication tokens if needed.
  Future<void> refresh();

  /// Sends an email verification link to the user.
  ///
  /// Takes user's [email] address.
  /// Sends verification instructions to the provided email.
  Future<void> sendEmailVerification(String email);
}

typedef GoogleSignInFactory = GoogleSignIn Function(List<String> scopes);

/// Implementation of the base interface AuthService
class AuthServiceImpl implements AuthService {
  final PocketBase pb;
  final GoogleSignInFactory googleSignInFactory;
  final Talker logger;

  late StreamController<UserDTO?> _userController;

  AuthServiceImpl({
    required this.pb,
    required this.googleSignInFactory,
    required this.logger,
  }) {
    _userController = StreamController<UserDTO?>();

    _updateUserState();
  }

  void _updateUserState() {
    debugPrint('authStore.isValid: ${pb.authStore.isValid}');
    if (pb.authStore.isValid) {
      _userController.add(UserDTO.fromRecord(pb.authStore.record!));
      _users.authRefresh();
    } else {
      _userController.add(null);
    }
  }

  RecordService get _users => pb.collection("users");

  @override
  Stream<UserDTO?> get user => _userController.stream;

  @override
  Future<void> signUp({required UserDTO dto}) async {
    try {
      logger.info('[AuthService] Performing signUp');
      await _users.create(body: dto.toJson()).then((response) async {
        logger.info('[AuthService] User signed up successfully $response');
        await _users.requestVerification(dto.email);
        logger.info('[AuthService] Email correctly sent to ${dto.email}');
      });
    } on ClientException catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signUp',
        error,
        stackTrace,
      );
      throw switch (error.statusCode) {
        400 => SignUpError(),
        403 => UnauthorizedError(),
        404 => NotFoundError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signUp',
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
      final recordAuth = await _users.authWithPassword(email, password);
      pb.authStore.save(recordAuth.token, recordAuth.record);
    } on ClientException catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signIn',
        error,
        stackTrace,
      );
      throw switch (error.statusCode) { 400 => SignInError(), _ => GenericError() };
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signIn',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _users.requestPasswordReset(email);
    } on ClientException catch (error, stackTrace) {
      logger.error('[AuthService] Error performing resetPassword', error, stackTrace);

      throw switch (error.statusCode) { 400 => InvalidRequestError(), _ => GenericError() };
    } catch (error, stackTrace) {
      logger.error('[AuthService] Error performing resetPassword', error, stackTrace);

      rethrow;
    }
  }

  @override
  void signOut() {
    logger.info('[AuthService] Performing signOut');
    pb.authStore.clear();
    logger.info('[AuthService] SignOut successful');
  }

  @override
  Future<void> refresh() async {
    try {
      logger.info('[AuthService] Performing refresh');

      await _users.authRefresh();
      logger.info('[AuthService] refresh successful');
    } on ClientException catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signIn',
        error,
        stackTrace,
      );
      throw switch (error.statusCode) {
        401 => UnauthorizedError(),
        403 => UnauthorizedError(),
        404 => RefreshTokenError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signIn',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification(String email) async {
    try {
      await _users.requestVerification(email);
    } catch (error, stackTrace) {
      logger.error('[AuthService] Error performing sendEmailVerification', error, stackTrace);

      rethrow;
    }
  }
}
