import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/reports/models/onu_power_report_model.dart';

class ONUPowerReportService {
  Future<List<ONUPowerReport>> getONUPowerReportData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<ONUPowerReport>("api/onu-power-report/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = (response.data as List)
          .map((item) => ONUPowerReport.fromJson(item as Map<String, dynamic>))
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
