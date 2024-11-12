import 'package:Octanet/features/login/models/login_response.dart';
import 'package:Octanet/features/login/models/refresh_request.dart';
import 'package:flutter/foundation.dart';
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/base/base_model.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';
import 'package:Octanet/data/api_client/api_response.dart';

class ApiClient extends GetConnect {
  var url = Constants.BASE_URL;

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  Future<ApiResponse<T>> getRequest<T>(String endPoint, {isAuth = true}) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {};
      if (isAuth) {
        headers['Authorization'] = "Bearer ${await getToken()}";
      }
      Response response = await httpClient.get(
        '$url$endPoint',
        headers: headers,
      );
      return returnResponse<T>(response);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ApiResponse<T>> postRequest<T>(String endPoint, BaseModel data,
      {isAuth = true}) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {};
      if (isAuth) {
        headers['Authorization'] = "Bearer ${await getToken()}";
      }
      Response response = await httpClient.post(
        '$url$endPoint',
        headers: headers,
        body: data.toJson(),
      );
      return returnResponse<T>(response);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ApiResponse<T>> postRequestWithFile<T>(String endPoint, data,
      {isAuth = true}) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {};
      if (isAuth) {
        headers['Authorization'] = "Bearer ${await getToken()}";
      }
      Response response = await httpClient.post(
        '$url$endPoint',
        headers: headers,
        body: data,
      );
      return returnResponse<T>(response);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ApiResponse<T>> putRequest<T>(String endPoint, BaseModel data,
      {isAuth = true}) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {};
      if (isAuth) {
        headers['Authorization'] = "Bearer ${await getToken()}";
      }
      Response response = await httpClient.put(
        '$url$endPoint',
        headers: headers,
        body: data.toJson(),
      );
      return returnResponse<T>(response);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ApiResponse<T>> deleteRequest<T>(String endPoint,
      {isAuth = true}) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {};
      if (isAuth) {
        headers['Authorization'] = "Bearer ${await getToken()}";
      }
      Response response = await httpClient.delete(
        '$url$endPoint',
        headers: headers,
      );
      return returnResponse<T>(response);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException();
    }
  }

  Future<String> getToken() async {
    var token = Get.find<PrefUtils>().getToken();
    if (token == 'refresh_token') {
      RefreshRequest refreshRequest = RefreshRequest();
      refreshRequest.refresh = Get.find<PrefUtils>().getRefreshToken();
      var response = await postRequest('auth/token/refresh/', refreshRequest,
          isAuth: false);
      var data = LoginResponse.fromJson(response.data);
      Get.find<PrefUtils>().setUser(data);
      Get.find<PrefUtils>().setIsLogin(true);
      token = data.access ?? '';
    }

    if (token == '') {
      throw UnauthorizeException("Login to get access");
    }

    return token;
  }

  // bool isTokenExpired() {
  //   if (getUser().isEmpty) return true;
  //   LoginResponse user = LoginResponse.fromJson(json.decode(getUser()));
  //   DateTime currentTime = DateTime.now();
  //   DateTime? loginTime = user.loginTime;
  //   int? accessTokenExpire = user.accessTokenExpire;
  //   int? refreshTokenExpire = user.refreshTokenExpire;

  //   if (loginTime != null && refreshTokenExpire != null) {
  //     DateTime refreshExpirationTime =
  //         loginTime.add(Duration(seconds: refreshTokenExpire));
  //     bool refreshCurrentTime = currentTime.isAfter(refreshExpirationTime);
  //     if (accessTokenExpire != null && refreshCurrentTime == false) {
  //       DateTime accessExpirationTime =
  //           loginTime.add(Duration(seconds: accessTokenExpire));
  //       bool accessCurrentTime = currentTime.isAfter(accessExpirationTime);
  //       if (refreshExpirationTime.isAfter(accessExpirationTime)) {
  //         LoginService loginService = LoginService();
  //         RefreshRequest refreshRequest = RefreshRequest();
  //         refreshRequest.refresh = user.refresh;
  //         loginService.refreshToken(refreshRequest);
  //         return accessCurrentTime;
  //       }
  //       return false;
  //     }
  //     return refreshCurrentTime;
  //   }
  //   return true;
  // }

  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  ApiResponse<T> returnResponse<T>(Response response) {
    Logger.log(response.body);

    if (_isSuccessCall(response)) {
      try {
        return ApiResponse<T>.fromJson(response.body);
      } on FormatException {
        throw ApiResponseException();
      }
    }
    var errors = response.body;
    if (kDebugMode) {
      print(errors);
    }
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(errors["data"].toString(),
            status: errors["status"], time: errors["time"]);

      case 401:
      case 403:
        throw UnauthorizeException(errors["message"],
            status: errors["status"], time: errors["time"]);
      case 404:
        throw BadRequestException(errors["message"],
            status: errors["status"], time: errors["time"]);
      case 500:
        throw ServerException(errors['message']);
      default:
        throw ApiResponseException();
    }
  }
}
