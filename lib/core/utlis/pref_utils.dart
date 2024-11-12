import 'dart:convert';
import 'package:Octanet/features/login/models/login_response.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    debugPrint('SharedPreference Initialized');
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  String getToken() {
    try {
      String status = checkToken();
      if (status == 'login') {
        Get.offNamed(MyRoutes.loginRoute);
        Get.snackbar(
          'Error',
          'Session Expired.',
          backgroundColor: const Color(0xFFEC1C24),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      } else if (status == 'token') {
        LoginResponse user = LoginResponse.fromJson(json.decode(getUser()));
        return user.access ?? '';
      }
      return status;
    } catch (e) {
      return '';
    }
  }

  String getRefreshToken() {
    try {
      LoginResponse user = LoginResponse.fromJson(json.decode(getUser()));
      return user.refresh ?? '';
    } catch (e) {
      return '';
    }
  }

  String checkToken() {
    if (getUser().isEmpty) return 'login';
    LoginResponse user = LoginResponse.fromJson(json.decode(getUser()));
    DateTime currentTime = DateTime.now();
    DateTime? loginTime = user.loginTime;
    int? accessTokenExpire = user.accessTokenExpire;
    int? refreshTokenExpire = user.refreshTokenExpire;

    if (loginTime != null && refreshTokenExpire != null) {
      DateTime refreshExpirationTime =
          loginTime.add(Duration(seconds: refreshTokenExpire));
      bool refreshCurrentTime = currentTime.isAfter(refreshExpirationTime);
      if (accessTokenExpire != null && refreshCurrentTime == false) {
        DateTime accessExpirationTime =
            loginTime.add(Duration(seconds: accessTokenExpire));
        if (currentTime.isAfter(accessExpirationTime)) {
          return 'refresh_token';
        }
        return 'token';
      }
    }
    return 'login';
  }

  Future<void> deleteToken() {
    return _sharedPreferences!.setString('token', "");
  }

  Future<void> setUser(LoginResponse value) {
    return _sharedPreferences!.setString('user', json.encode(value.toJson()));
  }

  String getUser() {
    try {
      return _sharedPreferences!.getString('user') ?? '{}';
    } catch (e) {
      return '';
    }
  }

  Future<void> deleteUser() {
    return _sharedPreferences!.setString('user', '');
  }

  Future<void> setIsLogin(bool value) {
    return _sharedPreferences!.setBool('isLogin', value);
  }

  bool getIsLogin() {
    return _sharedPreferences!.getBool('isLogin') ?? false;
  }

  Future<void> deleteLogin() {
    return _sharedPreferences!.setBool('isLogin', false);
  }

  Future<void> setIsFirst(bool value) {
    return _sharedPreferences!.setBool('isFirst', value);
  }

  bool getIsFirst() {
    return _sharedPreferences!.getBool('isFirst') ?? true;
  }

  Future<void> setId(String value) {
    return _sharedPreferences!.setString('id', value);
  }

  String getId() {
    try {
      return _sharedPreferences!.getString('id') ?? '';
    } catch (e) {
      return '';
    }
  }
}
