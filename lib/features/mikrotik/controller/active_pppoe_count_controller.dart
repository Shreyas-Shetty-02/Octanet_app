import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/mikrotik/models/active_pppoe_model.dart';
import 'package:Octanet/features/mikrotik/service/active_pppoe_count_service.dart';

class ActivePPPOECountController extends GetxController {
  Rx<ActivePPPOE> activePPPOECountData = ActivePPPOE().obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchActivePPPOECountData();
  }

  Future<void> fetchActivePPPOECountData() async {
    isLoading.value = true;
    try {
      ActivePPPOE data =
          await ActivePPPOECountService().getActivePPPOECountData();
      activePPPOECountData.value = data;
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
