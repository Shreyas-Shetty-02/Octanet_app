import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/dashboard/models/dashboard_model.dart';
import 'package:Octanet/features/dashboard/service/dashboard_service.dart';

class DashboardController extends GetxController {
  Rx<DashboardResponse> dashboardData = DashboardResponse().obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    try {
      DashboardResponse data = await DashboardService().getDashboardData();
      dashboardData.value = data;
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
