import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/mikrotik/models/mikrotik_log_model.dart';

class MikrotikLogService {
  Future<MikrotikLog> getMikrotikLogData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<MikrotikLog>("api/mikrotik-utils/9/logs/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = MikrotikLog.fromJson(response.data);
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
