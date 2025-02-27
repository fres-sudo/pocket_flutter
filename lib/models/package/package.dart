class Package {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  const Package({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  factory Package.empty() {
    return const Package(
      appName: '',
      packageName: '',
      version: '',
      buildNumber: '',
    );
  }
}
