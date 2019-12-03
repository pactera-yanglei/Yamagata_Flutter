
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:yamagatabank_flutter/UI/splash_page.dart';
import 'package:yamagatabank_flutter/routers/router_init.dart';

class SplashRouter implements IRouterProvider{

  static String splashPage = "/splash";
  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
    router.define(splashPage, handler: Handler(handlerFunc: (_, params) => SplashPage()));
  }

}