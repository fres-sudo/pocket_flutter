part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = InitialUserState;

  const factory UserState.updating() = UpdatingUserState;

  const factory UserState.updated(User user) = UpdatedUserState;

  const factory UserState.errorUpdating(LocalizedError error) = ErrorUpdatingUserState;

  const factory UserState.deleting() = DeletingUserState;

  const factory UserState.deleted() = DeletedUserState;

  const factory UserState.errorDeleting(LocalizedError error) = ErrorDeletingUserState;

  const factory UserState.updatingPhoto() = UpdatingPhotoUserState;

  const factory UserState.updatedPhoto(User user) = UpdatedPhotoUserState;

  const factory UserState.errorUpdatingPhoto(LocalizedError error) = ErrorUpdatingPhotoUserState;

  const factory UserState.deletingPhoto() = DeletingPhotoUserState;

  const factory UserState.deletedPhoto(User user) = DeletedPhotoUserState;

  const factory UserState.errorDeletingPhoto(LocalizedError error) = ErrorDeletingPhotoUserState;
}
