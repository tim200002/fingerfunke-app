import 'package:package_info_plus/package_info_plus.dart';

class AppInfoService {
  PackageInfo? _packageInfo;

  Future<void> init() {
    return refresh();
  }

  Future<void> refresh() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  PackageInfo get packageInfo {
    if (_packageInfo == null) {
      throw Exception("You must initialize before accessing for the firt time");
    }
    return _packageInfo!;
  }
}
