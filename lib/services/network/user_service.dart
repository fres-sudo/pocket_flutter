import 'dart:io';

import 'package:pocket_flutter/errors/generic_errors.dart';
import 'package:pocket_flutter/errors/user_errors.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:talker/talker.dart';

/// Abstract class of UserService
/// Service responsible for handling user-related network operations.
///
/// This service provides methods to:
/// * Fetch user information by ID
/// * Update user profile picture
/// * Delete user profile picture
/// * Update user information
/// * Delete user account
abstract class UserService {
  /// Retrieves user information by their unique identifier.
  ///
  /// Returns [UserDTO] if found, null otherwise.
  Future<UserDTO?> get(String id);

  /// Updates the user's profile picture.
  ///
  /// Takes the [userId] and the image [file] to upload.
  /// Returns the URL of the uploaded image as a [String].
  Future<String> updateProfilePicture(String userId, File file);

  /// Deletes the user's profile picture.
  ///
  /// Takes the [userId] and [photoUrl] of the image to delete.
  Future<void> deleteProfilePicture(String userId, String photoUrl);

  /// Updates user information.
  ///
  /// Takes updated [user] data and returns the updated [UserDTO].
  Future<UserDTO> update(UserDTO user);

  /// Deletes a user account by their ID.
  ///
  /// Takes the [id] of the user to delete.
  Future<void> delete(String id);
}

/// Implementation of the base interface UserService
/// This class is used to interact with the user data.
/// It is used to perform CRUD operations on the user data.
class UserServiceImpl implements UserService {
  final PocketBase pb;
  final Talker logger;

  UserServiceImpl({
    required this.pb,
    required this.logger,
  });

  RecordService get _users => pb.collection("users");

  @override
  Future<void> delete(String id) async {
    try {
      logger.info('[UserService] Deleting user $id');
      await _users.delete(id);
      logger.info('[UserService] Deleted user $id');
    } on ClientException catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $id', error, stackTrace);

      throw switch (error.statusCode) {
        400 => DeleteUserError(),
        403 => UnauthorizedError(),
        404 => UserNotFoundError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $id', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<void> deleteProfilePicture(String userId, String avatar) async {
    try {
      logger.info('[UserService] Deleting user avatar $userId');
      logger.info('[UserService] Deleted user avatar $userId');
    } on ClientException catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $userId', error, stackTrace);

      throw switch (error.statusCode) {
        400 => DeleteUserImageError(),
        403 => UnauthorizedError(),
        404 => UserNotFoundError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $userId', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<UserDTO?> get(String id) async {
    try {
      logger.info('[UserService] Getting user $id');
      final response = await _users.getOne(id);
      logger.info('[UserService] Got user $id');
      return UserDTO.fromRecord(response);
    } on ClientException catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $id', error, stackTrace);

      throw switch (error.statusCode) {
        400 => InvalidUserDataError(),
        403 => UnauthorizedError(),
        404 => UserNotFoundError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user $id', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<UserDTO> update(UserDTO user) async {
    try {
      logger.info('[UserService] Updating user ${user.id}');
      final response = await _users.update(user.id ?? "", body: user.toJson());
      logger.info('[UserService] Updated user ${user.id}');
      return UserDTO.fromRecord(response);
    } on ClientException catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user ${user.id}', error, stackTrace);

      throw switch (error.statusCode) {
        400 => UpdateUserError(),
        403 => UnauthorizedError(),
        404 => UserNotFoundError(),
        _ => GenericError()
      };
    } catch (error, stackTrace) {
      logger.error('[UserService] Error deleting user ${user.id}', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<String> updateProfilePicture(String userId, File file) {
    return Future.value("");
  }
}
