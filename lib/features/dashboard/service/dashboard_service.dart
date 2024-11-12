import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/dashboard/models/dashboard_model.dart';

class DashboardService {
  Future<DashboardResponse> getDashboardData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<DashboardResponse>("api/dashboard/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = DashboardResponse.fromJson(response.data);
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
