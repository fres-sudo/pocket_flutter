import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  StorageService({
    required this.secureStorage,
  });

  static const String isFirstAccessKey = "first_access";

  final FlutterSecureStorage secureStorage;

  Future<bool> get isFirstAccess async => !(await secureStorage.containsKey(key: isFirstAccessKey));

  Future<void> setFirstAccess() async => await secureStorage.write(key: isFirstAccessKey, value: "false");

  Future<void> clearStorage() async => await secureStorage.deleteAll();

  Future<void> clearStorageWithoutFirstSeen() async {
    final keys = await secureStorage.readAll();
    for (final key in keys.keys) {
      if (key != isFirstAccessKey) {
        await secureStorage.delete(key: key);
      }
    }
  }

  Future<void> clearValue(String key) async => await secureStorage.delete(key: key);
}
