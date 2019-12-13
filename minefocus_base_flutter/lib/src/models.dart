import 'package:dart_json_mapper/annotations.dart';

/// Socialログインエンティティ
@jsonSerializable
class UserLoginResult {
  @JsonProperty(name: 'success')
  bool success;

  @JsonProperty(name: 'user')
  User user;

  @JsonProperty(name: 'error_message')
  UIMessage errorMessage;
}

/// UIメッセージエンティティ
@jsonSerializable
class UIMessage {
  @JsonProperty(name: 'title')
  String title;

  @JsonProperty(name: 'description')
  String description;
}

/// User
@jsonSerializable
class User {
  @JsonProperty(name: 'user_id')
  String userID;

  /// [0] ゲスト
  /// [100] 連携済み
  @JsonProperty(name: 'user_type')
  int userType;

  @JsonProperty(name: 'email')
  String email;

  /// [no_email] メールアドレスなし,
  /// [verified] 承認済み
  /// [not_verified] 未承認
  @JsonProperty(name: 'email_status')
  String emailStatus;

  @JsonProperty(name: 'connected_with')
  String connectedWith;

  @JsonProperty(name: 'can_change_email')
  bool canChangeEmail;

  @JsonProperty(name: 'tag_name')
  String tagName;

  @JsonProperty(name: 'account_status')
  int accountStatus;

  User({
    this.userID,
    this.userType,
    this.email,
    this.emailStatus,
    this.connectedWith,
    this.canChangeEmail,
    this.tagName,
    this.accountStatus
  });
}
