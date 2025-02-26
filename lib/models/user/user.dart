import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required bool emailVisibility,
    String? avatar,
    required DateTime created,
    required DateTime updated,
    required bool verified,
  }) = _User;

  static User fake() => User(
        id: '1',
        name: 'John Doe',
        email: 'john@doe.com',
        emailVisibility: true,
        avatar: null,
        created: DateTime.now(),
        updated: DateTime.now(),
        verified: true,
      );
}
