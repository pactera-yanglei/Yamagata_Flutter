import 'minefocus_api.dart';
import 'request.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'user_content.dart';
import 'models.dart';

/// ---------------ゲストユーザー作成---------------///
class CreateGuest extends MinefocusAPI<User> {
  @override
  String getPath() {
    return '/login/create_guest';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status != LoginStatus.notCreated) {
      return false;
    }
    return true;
  }

  @override
  intercept(Response response, Result<User, RequestError> result) {
    UserContext.getInstance().storeUser(status: LoginStatus.guest, user: result.data);
    UserContext.getInstance().storeAuthorizationToken(response);
  }
}

///---------------メールアドレス新規登録---------------///
class CreateUserWithEmail extends MinefocusAPI<UserLoginResult> {
  final String email;
  final String password;

  CreateUserWithEmail({@required this.email, @required this.password});

  @override
  String getPath() {
    return '/auth/createuser_email';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'email': email, 'password': password};
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.notCreated || status == LoginStatus.guest) {
      return true;
    }
    return false;
  }

  @override
  intercept(Response response, Result<UserLoginResult, RequestError> result) {
    if (result.data.success) {
      UserContext.getInstance().storeAuthorizationToken(response);
    }
  }
}

///---------------メールアドレス認証コード確認---------------///
class VerifyEmail extends MinefocusAPI<UserLoginResult> {
  final String code;

  VerifyEmail({@required this.code});

  @override
  String getPath() {
    return '/auth/verify_email';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'code': code};
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.emailLoggedIn || status == LoginStatus.guest) {
      return true;
    }
    return false;
  }

  @override
  intercept(Response response, Result<UserLoginResult, RequestError> result) {
    if (result.data.success) {
      UserContext.getInstance().storeAuthorizationToken(response);
      UserContext.getInstance().storeUser(status: LoginStatus.emailLoggedIn, user: result.data.user);
    }
  }
}

/// ---------------SNS連携---------------///
enum SNSType {
  facebook,
  google,
  yahoo,
}

class ConnectWithSNS extends MinefocusAPI<UserLoginResult> {
  final bool acceptNewRegistration;
  final String accessToken;
  final SNSType snsType;

  ConnectWithSNS({
    @required this.acceptNewRegistration,
    @required this.accessToken,
    @required this.snsType
  });

  @override
  String getPath() {
    return '/auth/connect_service';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    Map<String, dynamic> dict = {
      'accept_new_registration': acceptNewRegistration
    };
    switch (snsType) {
      case SNSType.facebook:
        dict["facebook_access_token"] = accessToken;
        break;
      case SNSType.google:
        dict["google_access_token"] = accessToken;
        break;
      case SNSType.yahoo:
        dict["yahoo_authorization_code"] = accessToken;
        break;
    }
    return dict;
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.notCreated || status == LoginStatus.guest) {
      return true;
    }
    return false;
  }

  @override
  intercept(Response response, Result<UserLoginResult, RequestError> result) {
    if (result.data.success) {
      UserContext.getInstance().storeUser(status: LoginStatus.snsConnected, user: result.data.user);
      UserContext.getInstance().storeAuthorizationToken(response);
    }
  }
}

///---------------メールアドレスログイン---------------///
class LoginWithEmail extends MinefocusAPI<UserLoginResult> {
  final String email;
  final String password;

  LoginWithEmail({@required this.email, @required this.password});

  @override
  String getPath() {
    return '/auth/connect_email';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'email': email, 'password': password};
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.notCreated || status == LoginStatus.guest) {
      return true;
    }
    return false;
  }

  @override
  intercept(Response response, Result<UserLoginResult, RequestError> result) {
    if (result.data.success) {
      UserContext.getInstance().storeUser(status: LoginStatus.emailLoggedIn, user: result.data.user);
      UserContext.getInstance().storeAuthorizationToken(response);
    }
  }
}

/// ---------------パスワード変更---------------///
class ChangePassword extends MinefocusAPI<UserLoginResult> {
  final String oldPassword;
  final String newPassword;

  ChangePassword({@required this.oldPassword, @required this.newPassword});

  @override
  String getPath() {
    return '/auth/change_password';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.put;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'old_password': oldPassword, 'new_password': newPassword};
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.emailLoggedIn) {
      return true;
    }
    return false;
  }
}

///---------------メールアドレス変更---------------///
class RequestChangeEmail extends MinefocusAPI<UserLoginResult> {
  final String email;
  final String password;

  RequestChangeEmail({@required this.email, @required this.password});

  @override
  String getPath() {
    return '/auth/request_change_email';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'email': email, 'password': password};
  }

  @override
  bool prepareRequest() {
    final status = UserContext.getInstance().loginStatus;
    if (status == LoginStatus.emailLoggedIn) {
      return true;
    }
    return false;
  }
}

///---------------パスワードリセット---------------///
class RequestResetPassword extends MinefocusAPI {
  final String email;

  RequestResetPassword({@required this.email});

  @override
  String getPath() {
    return '/auth/request_reset_password';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'email': email};
  }
}

///---------------ログアウト---------------///
class UserLogout extends MinefocusAPI {
  final List<String> ids;

  UserLogout({this.ids});

  @override
  String getPath() {
    return '/auth/logout';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {
    return {'notification_ids': ids};
  }
}
