import 'package:pocket_flutter/models/user/user.dart';
import 'package:pocket_flutter/services/dtos/user/user_dto.dart';
import 'package:pine/pine.dart';

class UserMapper extends DTOMapper<UserDTO, User> {
  @override
  User fromDTO(UserDTO dto) => User(
        id: dto.id ?? "",
        email: dto.email,
        name: dto.name,
        verified: dto.verified,
        emailVisibility: dto.emailVisibility,
        avatar: dto.avatar,
        created: dto.created,
        updated: dto.updated,
      );

  @override
  UserDTO toDTO(User model) => UserDTO(
        id: model.id,
        email: model.email,
        name: model.name,
        verified: model.verified,
        emailVisibility: model.emailVisibility,
        avatar: model.avatar,
        created: model.created,
        updated: model.updated,
      );
}
