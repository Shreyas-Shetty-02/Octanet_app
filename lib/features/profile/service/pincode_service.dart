import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/profile/models/pincode_model.dart';

class PincodeService {
  Future<PincodeResponse> getPincodeData(String pincode) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<PincodeResponse>("api/pincode/$pincode", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = PincodeResponse.fromJson(response.data);
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
