import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/reports/models/action_report_model.dart';

class ActionReportService {
  Future<List<ActionReport>> getActionReportData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<ActionReport>("api/update/audit/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = (response.data as List)
          .map((item) => ActionReport.fromJson(item as Map<String, dynamic>))
          .toList();
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
