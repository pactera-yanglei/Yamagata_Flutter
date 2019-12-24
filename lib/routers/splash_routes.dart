
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:yamagatabank_flutter/UI/MainTabWidget.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginWebView.dart';
import 'package:yamagatabank_flutter/UI/splash/rules_page.dart';
import 'package:yamagatabank_flutter/UI/splash/splash_page.dart';
import 'package:yamagatabank_flutter/UI/splash/welcome_page.dart';
import 'package:yamagatabank_flutter/routers/router_init.dart';
import 'package:yamagatabank_flutter/webtest.dart';

class SplashRouter implements IRouterProvider{

  static String splashPage = "/splash";
  static String rulesPage = "/rules";
  static String welcomePage = "/welcome";
  static String mainPage = "/main";
  static String loginWebPage = "/loginweb";
  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
    router.define(splashPage, handler: Handler(handlerFunc: (_, params) => SplashPage()));
    router.define(rulesPage, handler: Handler(handlerFunc: (_, params) => RulesPage()));
    router.define(welcomePage, handler: Handler(handlerFunc: (_, params) => WelcomePage()));
    router.define(mainPage, handler: Handler(handlerFunc: (_, params) => MainTabWidget()));
    router.define(loginWebPage, handler: Handler(handlerFunc: (_, params) => LoginWeb()));
  }

}