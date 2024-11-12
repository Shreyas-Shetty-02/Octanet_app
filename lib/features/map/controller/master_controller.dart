import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/map/models/master_item_model.dart';
import 'package:Octanet/features/map/service/master_item_service.dart';

class MasterItemController extends GetxController {
  RxList<MasterItem> masterItemData = <MasterItem>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchMasterItemData();
  }

  Future<void> fetchMasterItemData() async {
    isLoading.value = true;
    try {
      List<MasterItem> data = await MasterItemService().getMasterItemData();
      masterItemData.assignAll(data);
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
