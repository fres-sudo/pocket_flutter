import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_flutter/errors/generic_errors.dart';
import 'package:pocket_flutter/errors/localized.dart';
import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/repositories/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

/// The UserBloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  /// Create a new instance of [UserBloc].
  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<UpdateUserUserEvent>(_onUpdateUser);
    on<UpdateUserPhotoUserEvent>(_onUpdateUserPhoto);
    on<DeleteUserUserEvent>(_onDeleteUser);
    on<DeleteUserPhotoUserEvent>(_onDeleteUserPhoto);
  }

  /// Method used to add the [UpdateUserUserEvent] event
  void updateUser({required User user}) => add(UserEvent.updateUser(user: user));
  void deleteUser({required String id}) => add(UserEvent.deleteUser(id: id));
  void updateUserPhoto({required String id, required XFile photo}) =>
      add(UserEvent.updateUserPhoto(id: id, photo: photo));
  void deleteUserPhoto({required String userId, required String photoUrl}) =>
      add(UserEvent.deleteUserPhoto(userId: userId, photoUrl: photoUrl));

  FutureOr<void> _onUpdateUser(
    UpdateUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updating());
    try {
      final user = await userRepository.update(event.user);
      emit(UserState.updated(user));
    } on LocalizedError catch (error) {
      emit(UserState.errorUpdating(error));
    } catch (_) {
      emit(UserState.errorUpdating(GenericError()));
    }
  }

  FutureOr<void> _onDeleteUser(
    DeleteUserUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.deleting());
    try {
      await userRepository.delete(
        event.id,
      );
      emit(const UserState.deleted());
    } on LocalizedError catch (error) {
      emit(UserState.errorDeleting(error));
    } catch (_) {
      emit(UserState.errorDeleting(GenericError()));
    }
  }

  FutureOr<void> _onUpdateUserPhoto(
    UpdateUserPhotoUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.updatingPhoto());
    try {
      final user = await userRepository.updateProfilePicture(event.id, event.photo);
      emit(UserState.updatedPhoto(user));
    } on LocalizedError catch (error) {
      emit(UserState.errorUpdatingPhoto(error));
    } catch (_) {
      emit(UserState.errorUpdatingPhoto(GenericError()));
    }
  }

  FutureOr<void> _onDeleteUserPhoto(
    DeleteUserPhotoUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.deletingPhoto());
    try {
      final user = await userRepository.deleteProfilePicture(event.userId, event.photoUrl);
      emit(UserState.deletedPhoto(user));
    } on LocalizedError catch (error) {
      emit(UserState.errorDeletingPhoto(error));
    } catch (_) {
      emit(UserState.errorDeletingPhoto(GenericError()));
    }
  }
}
