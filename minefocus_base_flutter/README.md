# minefocus_base_flutter
[![support](https://img.shields.io/badge/platform-flutter%7Cdart-ff69b4.svg?style=flat-square)](https://github.com/flutterchina/dio)

#### minefocus共同库，功能有API请求、数据解析及映射、数据加密存储、用户相关api的封装...


## 添加依赖
##### `pubspec.yaml`内容如下。
   
```yaml
dependencies:
  minefocus_base_flutter:
    git:
      url: https://github.com/minefocus/minefocus_base_flutter.git
           
dev_dependencies:
  build_runner: ^1.6.6
```


## 初始化
##### 因为 `flutter` 没有映射所以借助[dart_json_mapper](https://pub.flutter-io.cn/packages/dart_json_mapper)进行json转model，因此导入的工程需要使用[build_runner](https://pub.flutter-io.cn/packages/build_runner)
   * 工程根目录追加文件 `build.yaml`,内容如下。

     ```yaml
     targets:
       $default:
        builders:
         reflectable:
           generate_for:
             - lib/main.dart
           options:
             formatted: true
     ```

   * 工程目录终端执行

     ```shell
     > pub run build_runner build
     ```
      执行成功后`mian.dart`同级目录下会生成 `main.reflectable.dart`,并将 `main.reflectable.dart`内的 `initializeReflectable()`全局方法添加到 `main.dart`中。

##### `main.dart` 执行初始设置方法配置baseurl。

```Dart
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'main.reflectable.dart';
     
 void main() async {
   initializeReflectable();
   await MinefocusBase.getInstance().init('base_url');
   runApp(MyApp());
 }
```


## 请求示例
#### 每个api都是一个实体， api实体调用 `request`方法发起请求。
```Dart
/// 创建请求实体
class LoginWithEmail extends MinefocusAPI<UserLoginResult> {

  final String email;
  final String password;

  LoginWithEmail({this.email, this.password})
      : assert(email != null),
        assert(password != null);

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

  /// 请求前处理
  /// return [false] 不发起请求, [request()] return [Result(false)]
  @override
  Future<bool> prepareRequest() async {
    LoginStatus status = await UserContext.shared().loginStatus;
    if (status == LoginStatus.notCreated || status == LoginStatus.guest) {
      return true;
    }
    return false;
  }

  /// 请求后数据处理
  @override
  intercept(Response response, Result<UserLoginResult, RequestError> result) {
    UserContext.shared().storeUser(LoginStatus.emailLoggedIn, result.data.user);
    UserContext.shared().storeAuthorizationToken(response);
  }
}

/// request api then
final req = LoginWithEmail(email: 'wangcong@1.1', password: 'qwer1234');
req.request().then((result){
     if (result.success) {
         print('LoginWithEmail data --${result.data}');
    } else {
        print('LoginWithEmail  error');
    }
 });


/// request api await
final req = LoginWithEmail(email: 'wangcong@1.1', password: 'qwer1234');
final result = await req.request();
if (result.success) {
   print('LoginWithEmail data --${result.data}');
  } else {
    print('LoginWithEmail  error');
}
```


## 数据存储示例
```Dart
test() async {
  final storage = MinefocusBase.getInstance().storage;
  /// [shared_preferences]加密存
  storage.setToSp(key: 'sp-key', value: 'sp-value');
  /// [shared_preferences]解密取
  final spValue = storage.getFromSp(key: 'sp-key');

  /// [keychain]加密存
  storage.setToKc(key: 'kc-key', value: 'kc-value');
  /// [keychain]解密取
  final kcValue = await storage.getFromKc(key: 'kc-key');
}
```

##### `SecureStorageUtil` 使用`AES`进行加密解密。


## 结构图
![结构图.png](https://github.com/minefocus/minefocus_base_flutter/blob/master/IMG/MinefocusBase结构图.png)

## 使用到的第三方pub
 * 网络请求:[dio](https://pub.flutter-io.cn/packages/dio)
 * 获取设备信息:[device_info](https://pub.flutter-io.cn/packages/device_info)
 * 获取APP信息:[package_info](https://pub.flutter-io.cn/packages/package_info)
 * json转model:[dart_json_mapper](https://pub.flutter-io.cn/packages/dart_json_mapper)
 * 字典存储:[shared_preferences](https://pub.flutter-io.cn/packages/shared_preferences)
 * keychain存储:[flutter_secure_storage](https://pub.flutter-io.cn/packages/flutter_secure_storage)
 * 字符串AES加密:[encrypt](https://pub.flutter-io.cn/packages/encrypt#-readme-tab-)
