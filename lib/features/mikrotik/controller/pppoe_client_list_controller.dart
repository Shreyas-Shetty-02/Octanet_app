import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/mikrotik/models/pppoe_client_list_model.dart';
import 'package:Octanet/features/mikrotik/service/pppoe_client_list_service.dart';

class PPPOEClientListController extends GetxController {
  RxList<PPPOEClientList> pppoeClientListData = <PPPOEClientList>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchPPPOEClientData();
  }

  Future<void> fetchPPPOEClientData() async {
    isLoading.value = true;
    try {
      List<PPPOEClientList> data =
          await PPPOEClientListService().getPPPOEClientListData();
      pppoeClientListData.assignAll(data);
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
