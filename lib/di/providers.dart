part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Talker>(
    create: (_) => Talker(),
  ),
  Provider<FlutterSecureStorage>(
    create: (_) => FlutterSecureStorage(),
  ),
  Provider<AsyncAuthStore>(
      create: (context) => AsyncAuthStore(
            save: (String data) async =>
                await context.read<FlutterSecureStorage>().write(key: K.authStoreKey, value: data),
            initial: LocalStorage.instance.storedValue,
          )),
  Provider<PocketBase>(
      create: (context) => PocketBase(K.pocketBaseConnectionUrl, authStore: context.read<AsyncAuthStore>())),
  Provider<AuthService>(
    create: (context) => AuthServiceImpl(
      googleSignInFactory: (scopes) => GoogleSignIn(
        clientId: Platform.isIOS ? K.googleClientId : null,
        scopes: scopes,
      ),
      logger: context.read(),
      pb: context.read(),
    ),
  ),
];
