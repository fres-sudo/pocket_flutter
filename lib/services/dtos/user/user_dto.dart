import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine/pine.dart';
import 'package:pocket_flutter/misc/constants.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO extends DTO with _$UserDTO {
  const UserDTO._();

  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory UserDTO({
    String? id,
    required String name,
    required String email,
    required bool emailVisibility,
    String? avatar,
    required DateTime created,
    required DateTime updated,
    required bool verified,
  }) = _UserDTO;

  static UserDTO fake() => UserDTO(
        id: '1',
        name: 'John Doe',
        email: "ciaoasdajnsd",
        emailVisibility: true,
        created: DateTime.now(),
        updated: DateTime.now(),
        verified: true,
      );

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  factory UserDTO.fromRecord(RecordModel record) {
    final json = record.toJson();
    final avatarUrl =
        json['avatar'] != null ? "${K.pocketBaseConnectionUrl}/api/files/users/${record.id}/${json['avatar']}" : null;
    return UserDTO(
      id: record.id,
      name: json['name'],
      email: json['email'],
      emailVisibility: json['emailVisibility'],
      avatar: avatarUrl,
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      verified: json['verified'],
    );
  }
}
