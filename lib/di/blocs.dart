part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      authRepository: context.read(),
    ),
  )
];
