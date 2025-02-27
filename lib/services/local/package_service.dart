import 'package:package_info_plus/package_info_plus.dart';
import 'package:pocket_flutter/models/package/package.dart';

class PackageService {
  PackageInfo? _packageInfo;

  PackageService();

  Future<void> initialize() async => _packageInfo ??= await PackageInfo.fromPlatform();

  Future<Package> getPackageInfo() async {
    await initialize();
    return Package(
      appName: _packageInfo!.appName,
      packageName: _packageInfo!.packageName,
      version: _packageInfo!.version,
      buildNumber: _packageInfo!.buildNumber,
    );
  }

  Future<String> get appName async {
    await initialize();
    return _packageInfo!.appName;
  }

  Future<String> get packageName async {
    await initialize();
    return _packageInfo!.packageName;
  }

  Future<String> get version async {
    await initialize();
    return _packageInfo!.version;
  }

  Future<String> get buildNumber async {
    await initialize();
    return _packageInfo!.buildNumber;
  }
}
