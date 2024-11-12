import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/reports/models/action_report_model.dart';
import 'package:Octanet/features/reports/service/action_report_service.dart';

class ActionReportController extends GetxController {
  RxList<ActionReport> actionReportData = <ActionReport>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchActionReportData();
  }

  Future<void> fetchActionReportData() async {
    isLoading.value = true;
    try {
      List<ActionReport> data =
          await ActionReportService().getActionReportData();
      actionReportData.assignAll(data);
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
