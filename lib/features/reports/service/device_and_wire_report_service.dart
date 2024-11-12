import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/reports/models/device_and_wire_report_model.dart';

class DeviceReportService {
  Future<List<DeviceItem>> getDeviceReportData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<DeviceAndWireReport>("api/report/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      DeviceAndWireReport deviceReport =
          DeviceAndWireReport.fromJson(response.data);
      return deviceReport.device?.devices ?? [];
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

class WireReportService {
  Future<List<WireItem>> getWireReportData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<DeviceAndWireReport>("api/report/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      DeviceAndWireReport wireReport =
          DeviceAndWireReport.fromJson(response.data);
      return wireReport.wire?.wires ?? [];
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
