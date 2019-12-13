import 'dart:math';

import 'package:dio/dio.dart';
import 'app_info.dart';
import 'dart:async';
import 'request.dart';
import 'keys.dart';
import '../minefocus_base_flutter.dart';

/// Minefocus JWT 请求基类
/// 泛型[T]为 Result.data的类型
class MinefocusAPI<T> extends BaseRequest {
  @override
  String getBaseUrl() {
    return MinefocusBase.getInstance().minefocusBaseUrl;
  }

  @override
  String getPath() {
    return '';
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.get;
  }

  @override
  Future<Map<String, dynamic>> getHeaders() async {
    /// 配置JWT 自定义headers
    final appInfo = MinefocusBase.getInstance().appInfo;
    Map<String, dynamic> header = {
      HeaderRequestKey.deviceMachineName: appInfo.systemName,
      HeaderRequestKey.deviceSystemVersion: appInfo.systemVersion,
      HeaderRequestKey.minefocusApp: '${appInfo.systemName} ${appInfo.packageName} ${appInfo.version}'
    };

    /// 设置存储在keychain里的authorizationToken
    final storage = MinefocusBase.getInstance().storage;
    final authorizationToken = await storage.getFromKc(key: UserKey.authorizationToken);
    if (authorizationToken != null) {
      header[HeaderRequestKey.authorization] = 'Bearer ' + authorizationToken;
    }
    return header;
  }

  /// request
  Future<Result<T, CallBackError>> request() async {
    // prepare
    if (!prepareRequest()) return Result(false);
    // request start
    Result<T, RequestError> result = await RequestManager.getInstance().request<T>(this);
    if (result.success) {
      intercept(result.response, result);
      return Result(true, data: result.data);
    } else {
      return Result(false, error: CallBackError(result.error), response: result.response);
    }
  }

  /// 请求前处理,需要子类重写
  /// return [false] 不发起请求, [request()] return [Result(false)]
  bool prepareRequest() {
    return true;
  }

  /// 请求后数据处理,需要子类重写
  intercept(Response response, Result<T, RequestError> result) {}
}

enum ErrorType {
  internetConnection,
  server,
  jwt,
  unavailable,
  timeOut,
  cancel,
  maping
}

class CallBackError {

  RequestError requestError;
  /// ErrorType  type;
  ErrorType type;
  /// 根据ErrorType生成errorMsg
  String get errorMsg {
    final config = MinefocusBase.getInstance().config;
    switch (type) {
      case ErrorType.internetConnection:
        return config.internetConnectionError;
        break;
      case ErrorType.server:
        return config.serverError;
        break;
      case ErrorType.jwt:
        final status = UserContext.getInstance().loginStatus;
        if (status == LoginStatus.guest || status == LoginStatus.notCreated) {
          return config.jwtGuestError;
        } else {
          return config.jwtLoginError;
        }
        break;
      case ErrorType.unavailable:
        return config.unavailableError;
        break;
      case ErrorType.timeOut:
        return config.timeOutError;
        break;
      case ErrorType.cancel:
        return config.internetConnectionError;
        break;
      case ErrorType.maping:
        return config.unavailableError;
        break;
    }
    return null;
  }

  CallBackError(this.requestError) {
    switch (requestError.errorType) {
      case RequestErrorType.normal:
        switch (requestError.dioError.type) {
          case DioErrorType.CONNECT_TIMEOUT:
            this.type = ErrorType.timeOut;
            break;
          case DioErrorType.SEND_TIMEOUT:
            this.type = ErrorType.timeOut;
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            this.type = ErrorType.timeOut;
            break;
          case DioErrorType.RESPONSE:
            switch (requestError.dioError.response.statusCode) {
              case 401:
                this.type = ErrorType.jwt;
                break;
              case 503:
                this.type = ErrorType.unavailable;
                break;
              default:
                this.type = ErrorType.server;
                break;
            }
            break;
          case DioErrorType.CANCEL:
            this.type = ErrorType.cancel;
            break;
          case DioErrorType.DEFAULT:
            this.type = ErrorType.internetConnection;
            break;
        }
        break;
      case RequestErrorType.mapping:
        this.type = ErrorType.maping;
        break;
    }
  }

  @override
  String toString() {
    return 'type($type) errorMessage($errorMsg) requestError($requestError)';
  }
}
