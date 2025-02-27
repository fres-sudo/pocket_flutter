import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_flutter/models/package/package.dart';
import 'package:pocket_flutter/services/local/package_service.dart';

class PackageCubit extends Cubit<Package> {
  final PackageService _packageService;

  PackageCubit({required PackageService packageService})
      : _packageService = packageService,
        super(Package.empty()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final packageInfo = await _packageService.getPackageInfo();
    emit(packageInfo);
  }

  Future<void> refresh() async {
    await _initialize();
  }
}
