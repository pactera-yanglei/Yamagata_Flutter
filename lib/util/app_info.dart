
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class AppInfo {
  // 例12.3.1
  String systemVersion = '';

  // 例ios
  String systemName = '';

  // 例iPhone7,1
  String machine = '';

  // 例jp.co.awabank.securestarter.stg
  String packageName = '';

  // 例1.0.0
  String version = '';

  /// 创建单利
  static AppInfo _instance = AppInfo();

  static AppInfo getInstance() {
    return _instance;
  }

  /// 初始化
  Future<AppInfo> init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      /// ios deviceInfo
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      // 例12.3.1
      systemVersion = iosInfo.systemVersion;
      // 例ios
      systemName = iosInfo.systemName;
      // 例iPhone7,1
      machine = iosInfo.utsname.machine;
    }
    if (Platform.isAndroid) {
      /// androids deviceInfo
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      systemVersion = androidInfo.version.release;
      systemName = "Android";
      machine = androidInfo.model;
    }

    /// PackageInfo
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // 例jp.co.awabank.securestarter.stg
    packageName = packageInfo.packageName;
    // 例1.0.0
    version = packageInfo.version;
    return _instance;
  }
}
