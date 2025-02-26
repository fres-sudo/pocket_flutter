part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<DTOMapper<UserDTO, User>>(
    create: (_) => UserMapper(),
  ),
];
