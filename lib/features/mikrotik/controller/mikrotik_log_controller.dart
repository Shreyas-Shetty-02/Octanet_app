import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/mikrotik/models/mikrotik_log_model.dart';
import 'package:Octanet/features/mikrotik/service/mikrotik_log_service.dart';

class MikrotikLogController extends GetxController {
  Rx<MikrotikLog> mikrotikLogData = MikrotikLog().obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchMikrotikLogData();
  }

  Future<void> fetchMikrotikLogData() async {
    isLoading.value = true;
    try {
      MikrotikLog data = await MikrotikLogService().getMikrotikLogData();
      mikrotikLogData.value = data;
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
