import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine/pine.dart';
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

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  factory UserDTO.fromRecord(RecordModel record) => UserDTO.fromJson(record.toJson());
}
