
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:yamagatabank_flutter/routers/router_init.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';

class Routes {

  static String home = "/home";
  static String webViewPage = "/webview";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {

    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(SplashRouter());

  
    /// 初始化路由
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
