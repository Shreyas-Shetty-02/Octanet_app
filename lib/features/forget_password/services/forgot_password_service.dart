import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/forget_password/models/forgot_request.dart';

class ForgotPasswordService {
  Future<dynamic> send(ForgotRequest forgotRequest) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>().postRequest<dynamic>(
          "auth/password_reset/", forgotRequest,
          isAuth: false);
      ProgressDialogUtils.hideProgressDialog();
      var data = response.data ?? "Email sent successfully.";
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
