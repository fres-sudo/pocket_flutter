part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<AuthRepository>(
    create: (context) => AuthRepositoryImpl(
      authService: context.read(),
      userMapper: context.read(),
      logger: context.read(),
    ),
  ),
];
