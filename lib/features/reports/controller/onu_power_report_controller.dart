import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/reports/models/onu_power_report_model.dart';
import 'package:Octanet/features/reports/service/onu_power_report_service.dart';

class ONUPowerReportController extends GetxController {
  RxList<ONUPowerReport> onuPowerReportData = <ONUPowerReport>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchONUPowerReportData();
  }

  Future<void> fetchONUPowerReportData() async {
    isLoading.value = true;
    try {
      List<ONUPowerReport> data =
          await ONUPowerReportService().getONUPowerReportData();
      onuPowerReportData.assignAll(data);
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
