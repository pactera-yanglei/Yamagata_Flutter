import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:async';
import 'package:meta/meta.dart';

/// 用于数据存储工具
/// 字典存储，使用[shared_preferences]插件
/// keychain存储，使用[flutter_secure_storage]插件
/// 字符串使用[AES]加密
class SecureStorageUtil {
  /// 创建单利
  static SecureStorageUtil _instance = SecureStorageUtil();
  static SecureStorageUtil getInstance() {
    return _instance;
  }

  /// [shared_preferences] 存储实体
  SharedPreferences sharedPreferences;
  /// [keychain] 存储实体
  final storage = FlutterSecureStorage();

  /// 初始化[shared_preferences]
  /// *必须在调用存取方法前执行一次*
  Future<SecureStorageUtil> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return _instance;
  }

  /// [shared_preferences] 加密存
  setToSp({@required String key, @required String value}) {
    // 对value进行加密
    final encrypValue = EncrypterUtil.encrypt(value);
    // 对value进行存储
    sharedPreferences.setString(key, encrypValue);
  }

  /// [shared_preferences] 解密取
  String getFromSp({@required String key}) {
    // 读取value
    final encoded = sharedPreferences.getString(key);
    // 解密value
    if (encoded != null) {
      try {
        return EncrypterUtil.decrypt(encoded);
      } catch (error) {
        print('readSp decrypt fail error is $error');
        // 解密失败，从[sharedPreferences]删除此key
        sharedPreferences.remove(key);
        return null;
      }
    }
    return null;
  }

  /// [shared_preferences] 取所有的key
  Set<String> getKeysFromSp() {
    return sharedPreferences.getKeys();
  }

  /// [shared_preferences] 是否存在key
  bool containsKeyFromSp({@required String key}){
    return sharedPreferences.containsKey(key);
  }

  /// [shared_preferences] 删除
  removeFromSp({@required String key}) {
    sharedPreferences.remove(key);
  }

  /// [keychain] 加密存
  Future<void> setToKc({@required String key, @required String value}) async {
    // 对value进行加密
    final encrypValue = EncrypterUtil.encrypt(value);
    // 对value进行存储
    await storage.write(key: key, value: encrypValue);
  }

  /// [keychain] 解密取
  Future<String> getFromKc({@required String key}) async {
    // 读取value
    final encoded = await storage.read(key: key);
    // 解密value
    if (encoded != null) {
      try {
        return EncrypterUtil.decrypt(encoded);
      } catch (error) {
        print('readKc decrypt fail error is $error');
        // 解密失败，从[keychain]删除此key
        await storage.delete(key: key);
        return null;
      }
    }
    return null;
  }

  /// [keychain] 取所有的key和value
  Future<Map<String, String>> readAllFromKc() {
    return storage.readAll();
  }

  /// [keychain] 是否存在key
  Future<bool> containsKeyFromKc({@required String key}) async {
    final maps = await storage.readAll();
    return maps.containsKey(key);
  }

  /// [keychain] 删除
  Future<void> removeFromKc({@required String key}) async {
    await storage.delete(key: key);
    return;
  }
}

/// 字符串[AES]加密工具
class EncrypterUtil {
  static final _tailSecretKey = 'Minefocus Secure Encryption Key';
  static final _iv = IV.fromLength(16);

  /// 获取加密解密器
  static Encrypter _getEncrypter() {
    final secretKey = AppInfo.getInstance().packageName + _tailSecretKey;
    final base64key = base64Encode(utf8.encode(secretKey)).substring(0, 32);
    final key = Key.fromBase64(base64key);
    return Encrypter(AES(key));
  }

  /// 字符串加密
  static String encrypt(String value) {
    if (value == null) { return null; }
    final encrypter = _getEncrypter();
    final encrypted = encrypter.encrypt(value, iv: _iv);
    return encrypted.base64;
  }

  /// 字符串解密
  static String decrypt(String encoded) {
    if (encoded == null) { return null; }
    final encrypter = _getEncrypter();
    final decrypted = encrypter.decrypt64(encoded, iv: _iv);
    return decrypted;
  }
}
