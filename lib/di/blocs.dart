part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      authRepository: context.read(),
    ),
  ),
  BlocProvider<PackageCubit>(
    create: (context) => PackageCubit(
      packageService: context.read(),
    ),
  ),
  BlocProvider<UserBloc>(
    create: (context) => UserBloc(
      userRepository: context.read(),
    ),
  ),
];
