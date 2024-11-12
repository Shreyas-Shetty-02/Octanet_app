import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/mikrotik/models/active_pppoe_model.dart';

class ActivePPPOECountService {
  Future<ActivePPPOE> getActivePPPOECountData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>().getRequest<ActivePPPOE>(
          "api/mikrotik-utils/active-pppoe-count/",
          isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = ActivePPPOE.fromJson(response.data);
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
