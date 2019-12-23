/// HTTPRequestCustomHeaderField
class HeaderRequestKey {
  static const String minefocusApp = 'x-minefocus-app';
  static const String deviceMachineName = 'x-device-machine-name';
  static const String deviceSystemVersion = 'x-device-system-version';
  static const String authorization = 'Authorization';
}

/// HTTPResponseCustomHeaderField
class HeaderResponseKey {
  static const String authorizationToken = 'X-Authorization-Token';
}

class UserKey {
  static const String nameSpace = 'user.';

  /// shared_preferences
  static const String userID = nameSpace + 'user_id';
  static const String loginStatus = nameSpace + 'login_status';
  static const String notificationTagName = nameSpace + 'notification_tag_name';

  /// keychain
  static const String authorizationToken = nameSpace + 'authorization_token';
}
