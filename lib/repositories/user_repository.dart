import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pine/pine.dart';
import 'package:pocket_flutter/errors/user_errors.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pocket_flutter/services/network/user_service.dart';
import 'package:talker/talker.dart';

abstract class UserRepository {
  Future<User> update(User user);

  Future<User> updateProfilePicture(String userId, XFile file);

  Future<User> deleteProfilePicture(String userId, String photoUrl);

  Future<User> get(String id);

  Future<void> delete(String id);
}

class UserRepositoryImpl implements UserRepository {
  final UserService userService;
  final DTOMapper<UserDTO, User> userMapper;
  final Talker logger;

  const UserRepositoryImpl({
    required this.userService,
    required this.userMapper,
    required this.logger,
  });

  @override
  Future<User> update(User user) async {
    try {
      final dto = userMapper.toDTO(user);
      final response = await userService.update(dto);
      return userMapper.fromDTO(response);
    } catch (error, stackTrace) {
      logger.error(
        '[UserRepository] Error in the user update',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<User> updateProfilePicture(String userId, XFile file) async {
    try {
      final user = await get(userId);
      if (user.avatar != null && user.avatar!.isNotEmpty) {
        await deleteProfilePicture(userId, user.avatar!);
      }
      final imageUrl = await userService.updateProfilePicture(userId, File(file.path));
      return user.copyWith(avatar: imageUrl);
    } catch (error, stackTrace) {
      logger.error(
        '[UserRepository] Error in the user profile picture update',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<User> deleteProfilePicture(String userId, String photoUrl) async {
    try {
      await userService.deleteProfilePicture(userId, photoUrl);
      return await get(userId);
    } catch (error, stackTrace) {
      logger.error(
        '[UserRepository] Error in the user profile picture update',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<User> get(String id) async {
    try {
      final dto = await userService.get(id);
      if (dto == null) {
        throw UserNotFoundError();
      }
      return userMapper.fromDTO(dto);
    } catch (error, stackTrace) {
      logger.error(
        '[UserRepository] Error in the user fetch',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await userService.delete(id);
    } catch (error, stackTrace) {
      logger.error(
        '[UserRepository] Error in the user delete',
        error,
        stackTrace,
      );

      rethrow;
    }
  }
}
