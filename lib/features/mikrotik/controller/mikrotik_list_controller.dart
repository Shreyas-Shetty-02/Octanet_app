import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/mikrotik/models/mikrotik_list_model.dart';
import 'package:Octanet/features/mikrotik/service/mikrotik_list_service.dart';

class MikrotikListController extends GetxController {
  RxList<MikrotikList> mikrotikListData = <MikrotikList>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchMikrotikData();
  }

  Future<void> fetchMikrotikData() async {
    isLoading.value = true;
    try {
      List<MikrotikList> data =
          await MikrotikListService().getMikrotikListData();
      mikrotikListData.assignAll(data);
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
