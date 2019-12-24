import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dart_json_mapper/json_mapper.dart';
import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:yamagatabank_flutter/util/app_info.dart';

/// 请求方法
enum HttpMethod {
  get,
  post,
  put,
  header,
  delete,
}

/// 请求返回的数据
class Result<T, E> {
  bool success;
  T data;
  E error;
  Response response;
  Result(this.success, {this.response, this.data, this.error});
}

/// 请求error 类型
enum RequestErrorType {
  /// 普通失败
  normal,
  /// 映射失败
  mapping
}

/// 请求error
class RequestError {
  DioError dioError;
  dynamic mappingError;
  RequestErrorType errorType;

  RequestError.normal(DioError dioError) {
    this.dioError = dioError;
    this.errorType = RequestErrorType.normal;
  }

  RequestError.maping(dynamic mappingError) {
    this.mappingError = mappingError;
    this.errorType = RequestErrorType.mapping;
  }

  @override
  String toString() {
    if (errorType == RequestErrorType.mapping) {
      return 'mapping error ($mappingError)';
    } else {
      return 'dio error ($dioError)';
    }
  }
}

/// 用于记录正在请求的API
class RequestNotes {
  BaseRequest request;
  String get id => _id;
  String _id;
  DateTime startDate;

  RequestNotes({this.request}) {
    startDate = DateTime.now();
    final url = request.getBaseUrl() + request.getPath();
    _id = url + "_" + startDate.toString();
  }
}

/// 管理所有API的manager
class RequestManager {
  /// 创建单利
  static RequestManager _instance = RequestManager();
  static RequestManager getInstance() {
    return _instance;
  }

  /// public
  int connectTimeout = 12000;
  int sendTimeout = 12000;
  int receiveTimeout = 12000;
  bool userMockData = false;

  /// 正在请求的 队列
  List<RequestNotes> requestNotesList = List<RequestNotes>();

  /// 是否正在请求
  bool get isRequesting {
    return requestNotesList.length > 0;
  }

  /// privite
  // methods
  final String _get = 'Get';
  final String _post = 'Post';
  final String _put = 'Put';
  final String _header = 'Header';
  final String _delete = 'Delete';

  /// request设置
  Options _getOptions(Map<String, dynamic> headers, HttpMethod method) {
    String methodStr = _get;
    switch (method) {
      case HttpMethod.get:
        methodStr = _get;
        break;
      case HttpMethod.post:
        methodStr = _post;
        break;
      case HttpMethod.put:
        methodStr = _put;
        break;
      case HttpMethod.header:
        methodStr = _header;
        break;
      case HttpMethod.delete:
        methodStr = _delete;
        break;
    }
    return Options(
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        responseType: ResponseType.json,
        method: methodStr,
        contentType: ContentType.json);
  }

  /// [req] 请求实体类集成字[BaseRequest]
  /// [Resutlt] 返回数据, 返回指定model需要指定[T]类型
  /// 例子 Resutlt result = UserReq().request<USer>()
  Future<Result<T, RequestError>> request<T>(BaseRequest req) async {
    print(req);
    String url = req.getBaseUrl() + req.getPath();
    HttpMethod method = req.getMethod();
    Map<String, dynamic> parameter = req.getParameter();
    Map<String, dynamic> mockData = req.getMockData();
    Map<String, dynamic> headers = await req.getHeaders();
    Options option = _getOptions(headers, method);
    print('✨✨request.header-----$headers✨✨');
    /// 使用mock数据
    if (userMockData && mockData != null) {
      try {
        if (T != null) {
          T model = JsonMapper.fromMap<T>(mockData);
          return Result(true, data: model);
        } else {
          return Result(true);
        }
      } catch (error) {
        return Result(false, error: RequestError.maping(error));
      }
    }
    try {
      final notes = RequestNotes(request: req);
      requestNotesList.add(notes);


//      String code = SpUtil.getString('code');
//      Map<String, dynamic> m = new Map();
////    {'requestHeader': getRequestHeader(SpUtil.getString('uuid')), 'code': code,'grant_type':'authorization_code','redirect_uri':'"minefocus-yamagatabank://mt/login/callback"','client_id':'"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"'}
//
//      m['requestHeader'] = getRequestHeader(SpUtil.getString('uuid'));
//      m['code'] = '"$code"';
//      m['grant_type'] = '"authorization_code"';
//      m['redirect_uri']= '"minefocus-yamagatabank://mt/login/callback"';
//      m['client_id'] = '"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"';
//      String s =  getRequestHeader(SpUtil.getString('uuid'));
//      String pa = '{''"requestHeader":"$s"'
//                    '"code":"$code"'+
//                    '"grant_type":"authorization_code"'+
//                    '"redirect_uri":"minefocus-yamagatabank://mt/login/callback"'+
//                    '"client_id":"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"}';


      /// 请求start
      Response response = await Dio().request(url, data: parameter, options: option);
      requestNotesList.remove(notes);
      print('✨✨response.json-----${response.data}✨✨');
      try {
        if (T != dynamic) {
          /// request<T>传递了泛型， data返回泛型类<T>
          T model = JsonMapper.fromMap<T>(response.data);
          return Result(true, data: model, response: response);
        } else {
          /// request没传递泛型， 返回json
          return Result(true, data: response.data, response: response);
        }
      } catch (error) {
        /// 泛型映射失败error
        print('mapping error -----$error');
        return Result(false, error: RequestError.maping(error));
      }
    } catch (error) {
      /// 普通error
      return Result(false, error: RequestError.normal(error));
    }
  }
  String getRequestHeader(String uuid) {
//    RequestHeaderBean headerBean = new RequestHeaderBean();
//    headerBean.appOS = AppInfo.getInstance().systemVersion;
//    headerBean.modelName = AppInfo.getInstance().machine;
//    headerBean.deviceId = ' ';
//    headerBean.appVer = AppInfo.getInstance().version;
//    headerBean.uuid = uuid;
    Map<String, dynamic> m = new Map();
//    {'requestHeader': getRequestHeader(SpUtil.getString('uuid')), 'code': code,'grant_type':'authorization_code','redirect_uri':'"minefocus-yamagatabank://mt/login/callback"','client_id':'"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"'}
    String a = AppInfo.getInstance().systemVersion;
    String b = AppInfo.getInstance().machine;
    String d = AppInfo.getInstance().version;
    String c = ' ';
    m['appOS'] = 'Android $a';
    m['modelName'] =  AppInfo.getInstance().machine;
    m['deviceId'] = ' ';
    m['appVer']= AppInfo.getInstance().version;
    m['uuid'] = uuid;
    return '{"appOS":"Android $a", "modelName":"$b", "deviceId":" " ,"appVer":"3.3.3", "uuid":"$uuid"}';
//    return m.toString();
  }
}

abstract class BaseRequest {
  String getBaseUrl();

  String getPath();

  HttpMethod getMethod();

  /// 请求参数字典
  Map<String, dynamic> getParameter() {
    return null;
  }

  /// 请求headers字典
  Future<Map<String, dynamic>> getHeaders() async {
    return null;
  }

  /// 请求mock数据 当 [RequestManager].getInstance().userMockData = true 时有效
  Map<String, dynamic> getMockData() {
    return null;
  }

  @override
  String toString() {
    return '''🚀🚀-------request info--------🚀🚀
    🚀url: ${getBaseUrl() + getPath()}
    🚀method: ${getMethod()}
    🚀parameter: ${getParameter()}
    🚀🚀-------request info--------🚀🚀
    ''';
  }
}
