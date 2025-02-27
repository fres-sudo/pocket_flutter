part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUser({required User user}) = UpdateUserUserEvent;

  const factory UserEvent.updateUserPhoto({required String id, required XFile photo}) = UpdateUserPhotoUserEvent;

  const factory UserEvent.deleteUser({required String id}) = DeleteUserUserEvent;

  const factory UserEvent.deleteUserPhoto({
    required String userId,
    required String photoUrl,
  }) = DeleteUserPhotoUserEvent;
}
