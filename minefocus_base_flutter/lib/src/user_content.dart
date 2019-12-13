import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'package:dio/dio.dart';
import 'models.dart';
import 'keys.dart';
import 'package:meta/meta.dart';

/// ユーザーのログイン状況を表す
class LoginStatusValue {
  static const String notCreated = 'notCreated';
  static const String guest = 'guest';
  static const String snsConnected = 'snsConnected';
  static const String emailLoggedIn = 'emailLoggedIn';

  static LoginStatus getLoginStatusFromValue(String statusValue) {
    switch (statusValue) {
      case notCreated:
        return LoginStatus.notCreated;
        break;
      case guest:
        return LoginStatus.guest;
        break;
      case snsConnected:
        return LoginStatus.snsConnected;
        break;
      case emailLoggedIn:
        return LoginStatus.emailLoggedIn;
        break;
      default:
        return LoginStatus.notCreated;
        break;
    }
  }

  static String getLoginStatusValueFromState(LoginStatus status) {
    switch (status) {
      case LoginStatus.notCreated:
        return notCreated;
        break;
      case LoginStatus.guest:
        return guest;
        break;
      case LoginStatus.snsConnected:
        return snsConnected;
        break;
      case LoginStatus.emailLoggedIn:
        return emailLoggedIn;
        break;
      default:
        return notCreated;
        break;
    }
  }
}

/// ユーザーのログイン状況を表す
enum LoginStatus {
  // 未ログイン(規約に同意していない)
  notCreated,
  // ゲストログイン中
  guest,
  // ソーシャルアカウント中
  snsConnected,
  // メールアドレスログイン中
  emailLoggedIn
}

class UserContext {
  /// 创建单利
  static UserContext _instance = UserContext();
  static UserContext getInstance() {
    return _instance;
  }

  /// get LoginStatus
  get loginStatus {
    final storage = MinefocusBase.getInstance().storage;
    final statusStr = storage.getFromSp(key: UserKey.loginStatus);
    if (statusStr != null) {
      return LoginStatusValue.getLoginStatusFromValue(statusStr);
    }
    return LoginStatus.notCreated;
  }

  /// set LoginStatus
  setLoginStatus(LoginStatus status) async {
    final statusValue = LoginStatusValue.getLoginStatusValueFromState(status);
    final storage = MinefocusBase.getInstance().storage;
    storage.setToSp(key: UserKey.loginStatus, value: statusValue);
  }

  /// 存储JWT认证Token
  storeAuthorizationToken(Response response) async {
    final authorizationToken = response.headers[HeaderResponseKey.authorizationToken].first;
    if (authorizationToken != null) {
      final storage = MinefocusBase.getInstance().storage;
      await storage.setToKc(key: UserKey.authorizationToken, value: authorizationToken);
    }
  }

  /// 存储User
  storeUser({@required LoginStatus status, @required User user}) {
    final storage = MinefocusBase.getInstance().storage;
    setLoginStatus(status);
    storage.setToSp(key: UserKey.userID, value: user.userID);
    storage.setToSp(key: UserKey.notificationTagName, value: user.tagName);
  }

  /// 删除User
  deleteUser() async {
    final storage = MinefocusBase.getInstance().storage;
    storage.removeFromSp(key: UserKey.userID);
    storage.removeFromSp(key: UserKey.notificationTagName);
    storage.removeFromKc(key: UserKey.authorizationToken);
    setLoginStatus(LoginStatus.notCreated);
  }
}
