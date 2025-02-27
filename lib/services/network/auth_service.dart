import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:talker/talker.dart';

/// Abstract class of AuthService
abstract class AuthService {
  /// Returns the currently authenticated [User]
  Stream<UserDTO?> get user;

  /// Perform the login with [email] and [password].
  Future<void> signIn({
    required String email,
    required String password,
  });

  /// Perform sign up procedure putting [firstName],
  /// [firstName],[email] and [newPassword].
  Future<void> signUp({required UserDTO dto});

  /// Initiate a password reset procedure for the user linked by this [email].
  Future<void> resetPassword(String email);

  /// Perform the logout of the current user.
  Future<void> signOut();

  /// Perform to reload user
  Future<void> reload();

  /// Perform send email verification
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
    print('authStore.isValid: ${pb.authStore.isValid}');
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
      await _users.create(body: dto.toJson()).then((response) async {
        logger.info('[AuthService] User signed up successfully $response');
        await _users.requestVerification(dto.email);
        logger.info('[AuthService] Email correctly sent to ${dto.email}');
      });
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signOut',
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
    } catch (error, stackTrace) {
      logger.error('[AuthService] Error performing resetPassword', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      logger.info('[AuthService] Performing signOut');
      pb.authStore.clear();
      logger.info('[AuthService] SignOut successful');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing signOut',
        error,
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> reload() async {
    try {
      logger.info('[AuthService] Performing reload');

      final recordAuth = await _users.authRefresh();
      final currentUser = UserDTO.fromRecord(recordAuth.record);
      logger.info('[AuthService] Reload successful');
    } catch (error, stackTrace) {
      logger.error(
        '[AuthService] Error performing reload',
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
