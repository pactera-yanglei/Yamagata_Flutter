import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/util/app_info.dart';
import 'package:yamagatabank_flutter/util/request.dart';

import 'minefocus_api.dart';


///---------------メールアドレスログイン---------------///
class LoginWithEmail extends MinefocusAPI<String> {
  final String email;
  final String password;

  LoginWithEmail({@required this.email, @required this.password});

  @override
  String getPath() {
    return 'api/mt/token';
  }

  @override
  Future<Map<String, dynamic>> getHeaders() async {
    int num = randomNum(10000);
//    num = 3431;
    /// 配置JWT 自定义headers
    String uuid = SpUtil.getString('uuid');
    Map<String, dynamic> header = {
      'authKey1': '"Bearer $uuid"',
      'authKey2': '"$num"',
      'authKey3': shaEncode(uuid + '$num' + 'hirojima')
    };

    /// 设置存储在keychain里的authorizationToken
//    final storage = MinefocusBase.getInstance().storage;
//    final authorizationToken = await storage.getFromKc(key: UserKey.authorizationToken);
//    if (authorizationToken != null) {
//      header[HeaderRequestKey.authorization] = 'Bearer ' + authorizationToken;
//    }
    return header;
  }
  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Map<String, dynamic> getParameter() {

    String code = SpUtil.getString('code');
    Map<String, dynamic> m = new Map();
//    {'requestHeader': getRequestHeader(SpUtil.getString('uuid')), 'code': code,'grant_type':'authorization_code','redirect_uri':'"minefocus-yamagatabank://mt/login/callback"','client_id':'"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"'}

    m['"requestHeader"'] = getRequestHeader(SpUtil.getString('uuid'));
    m['"code"'] = '"$code"';
    m['"grant_type"'] = '"authorization_code"';
    m['"redirect_uri"']= '"minefocus-yamagatabank://mt/login/callback"';
    m['"client_id"'] = '"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"';
    return {'"requestHeader"':getRequestHeader(SpUtil.getString('uuid')),
            '"code"':'"$code"',
            '"grant_type"':'"authorization_code"',
            '"redirect_uri"':'"minefocus-yamagatabank://mt/login/callback"',
            '"client_id"':'"c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3"'};
  }

  @override
  bool prepareRequest() {

    return true;
  }

  @override
  intercept(Response response, Result<String, RequestError> result) {

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
    return '{"appOS":"Android $a","modelName":"$b","deviceId":" ","appVer":"3.3.3","uuid":"$uuid"}';
//    return m.toString();2471
  }

}
class RequestHeaderBean {
  String uuid;
  String deviceId;
  String modelName;
  String appOS;
  String appVer;
//  Map<String, dynamic> toJson() =>
//      {
//        'appOS': appOS,
//        'modelName': modelName,
//        'deviceId': deviceId,
//        'appVer': appVer,
//        'uuid': uuid,
//      };
}