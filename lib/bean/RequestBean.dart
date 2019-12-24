import 'package:yamagatabank_flutter/bean/RequestHeaderBean.dart';

class RequestBean{
  RequestHeaderBean requestHeader;
  String code;
  String grant_type;
  String redirect_uri;
  String client_id;


  RequestBean(this.requestHeader, this.code, this.grant_type, this.redirect_uri,
      this.client_id);

  Map<String, dynamic> toJson() =>
      {
        'requestHeader': requestHeader,
        'code': code,
        'grant_type': grant_type,
        'redirect_uri': redirect_uri,
        'client_id': client_id,
      };

}