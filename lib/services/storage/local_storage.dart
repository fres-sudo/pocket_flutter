/// A singleton class that manages user session storage.
///
/// This class provides basic functionality to store and manage a single string value
/// that persists during the application's runtime. It implements the singleton pattern
/// to ensure only one instance exists throughout the application's lifecycle.
///
/// Example usage:
/// ```dart
/// await UserSessionStorage.instance.initialize('initial value');
/// print(UserSessionStorage.instance.storedValue); // prints: initial value
/// await UserSessionStorage.instance.setValue('new value');
/// print(UserSessionStorage.instance.storedValue); // prints: new value
/// await UserSessionStorage.instance.clear();
/// print(UserSessionStorage.instance.storedValue); // prints: null
/// ```
///
/// Note: This storage is memory-based and will not persist after the application is closed.
/// It needs to be intialized at the start of the application to retrieve the stored value.
/// It's done in that way since the [AsyncAuthStore], the persistent layer or [PocketBase],
/// do not permit to initialize asyncronously the initial value of the storage.
class UserSessionStorage {
  /// Private constructor to prevent instantiation from outside the class.
  UserSessionStorage._();

  /// The singleton instance of [UserSessionStorage].
  static final UserSessionStorage instance = UserSessionStorage._();

  /// The stored string value. Can be null if no value is set or after clearing.
  String? _storedValue;

  /// Gets the currently stored value.
  ///
  /// Returns null if no value has been set or after [clear] has been called.
  String? get storedValue => _storedValue;

  /// Initializes the storage with an initial value.
  ///
  /// [initialValue] The string value to initialize the storage with.
  Future<void> initialize(String initialValue) async {
    _storedValue = initialValue;
  }

  /// Updates the stored value with a new string value.
  ///
  /// [newValue] The new string value to store.
  Future<void> setValue(String newValue) async {
    _storedValue = newValue;
  }

  /// Clears the stored value by setting it to null.
  Future<void> clear() async {
    _storedValue = null;
  }
}
