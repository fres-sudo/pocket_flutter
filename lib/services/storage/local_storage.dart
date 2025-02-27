class LocalStorage {
  // Private constructor
  LocalStorage._();

  // Singleton instance
  static final LocalStorage instance = LocalStorage._();

  // Storage variable
  String? _storedValue;

  // Getter for the stored value
  String? get storedValue => _storedValue;

  // Initialize the storage
  Future<void> initialize(String initialValue) async {
    _storedValue = initialValue;
  }

  // Update the stored value
  Future<void> setValue(String newValue) async {
    _storedValue = newValue;
  }

  // Clear the stored value
  Future<void> clear() async {
    _storedValue = null;
  }
}
