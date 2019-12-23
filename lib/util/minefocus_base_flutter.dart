library minefocus_base_flutter;

import 'package:minefocus_base_flutter/src/app_info.dart';
import 'package:minefocus_base_flutter/src/request.dart';
import 'package:minefocus_base_flutter/src/secure_storage_util.dart';

export 'src/app_info.dart';
export 'src/apis.dart';
export 'src/models.dart';
export 'src/request.dart';
export 'src/user_content.dart';
export 'src/minefocus_api.dart';
export 'src/secure_storage_util.dart';

class MinefocusBase {
  /// API管理单例
  RequestManager requestManager;

  /// 设备和包名信息单例
  AppInfo appInfo;

  /// 数据存储单例
  SecureStorageUtil storage;

  /// message管理单例
  final config = MinefocusConfig.getInstance();

  /// base url
  String get minefocusBaseUrl => _minefocusBaseUrl;
  String _minefocusBaseUrl;

  /// 创建单利
  static MinefocusBase _instance = MinefocusBase();
  static MinefocusBase getInstance() {
    return _instance;
  }

  /// 必需在[main.dart]里初始化
  Future<MinefocusBase> init(String baseUrl) async {
    _minefocusBaseUrl = baseUrl;
    appInfo = await AppInfo.getInstance().init();
    requestManager = RequestManager.getInstance();
    storage = await SecureStorageUtil.getInstance().init();
    return _instance;
  }
}

/// message管理单例，对于同项目不同error文言进行解耦
class MinefocusConfig {
  /// 创建单利
  static MinefocusConfig _instance = MinefocusConfig();
  static MinefocusConfig getInstance() {
    return _instance;
  }

  String internetConnectionError = '通信に失敗しました。通信環境の良い場所でご利用ください。';
  String serverError = '''予期せぬエラーが発生しました。
  お手数をおかけいたしますが、アプリをアンインストールして再インストールしてください。
  再インストール後も改善されない場合は、申し訳ございませんが、お取引店までご連絡ください。
  ''';
  String jwtLoginError = 'セッション情報が無効になりましたのでログアウトします。お手数ですが再ログインしてください。';
  String jwtGuestError = 'セッション情報が無効になりましたのでお手数ですが最初から利用を開始してください。';
  String unavailableError = 'ただいま混み合っております。申し訳ございませんがしばらくしてから再度ご利用ください';
  String timeOutError = 'ただいま混み合っております。申し訳ございませんがしばらくしてから再度ご利用ください';

}
