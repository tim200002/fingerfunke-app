import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo extends Equatable {
  final String id;

  const DeviceInfo({required this.id});

  DeviceInfo.fromAndroidDeviceInfo(AndroidDeviceInfo androidDeviceInfo)
      : id = androidDeviceInfo.id;

  DeviceInfo.fromIosDeviceInfo(IosDeviceInfo iosDeviceInfo)
      : id = iosDeviceInfo.identifierForVendor!;

  @override
  List<Object?> get props => [id];
}

class AppInfoService {
  PackageInfo? _packageInfo;
  DeviceInfo? _deviceInfo;

  Future<void> init() {
    return refresh();
  }

  Future<void> refresh() async {
    _packageInfo = await PackageInfo.fromPlatform();

    // get device info
    if (Platform.isAndroid) {
      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      _deviceInfo = DeviceInfo.fromAndroidDeviceInfo(androidDeviceInfo);
    } else if (Platform.isIOS) {
      final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      _deviceInfo = DeviceInfo.fromIosDeviceInfo(iosDeviceInfo);
    } else {
      throw Exception("Unsupported platform");
    }
  }

  PackageInfo get packageInfo {
    if (_packageInfo == null) {
      throw Exception(
          "You must initialize before accessing for the first time");
    }
    return _packageInfo!;
  }

  DeviceInfo get deviceInfo {
    if (_deviceInfo == null) {
      throw Exception(
          "You must initialize before accessing for the first time");
    }
    return _deviceInfo!;
  }
}
