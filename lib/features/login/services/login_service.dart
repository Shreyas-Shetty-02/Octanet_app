import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/login/models/login_request.dart';
import 'package:Octanet/features/login/models/login_response.dart';
import 'package:Octanet/features/login/models/refresh_request.dart';

class LoginService {
  Future<LoginResponse> login(LoginRequest loginData) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .postRequest<LoginResponse>("auth/token/", loginData, isAuth: false);
      ProgressDialogUtils.hideProgressDialog();
      var data = LoginResponse.fromJson(response.data);
      return data;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<LoginResponse> refreshToken(RefreshRequest refreshData) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>().postRequest<LoginResponse>(
          "auth/token/refresh/", refreshData,
          isAuth: false);
      ProgressDialogUtils.hideProgressDialog();
      var data = LoginResponse.fromJson(response.data);
      return data;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
