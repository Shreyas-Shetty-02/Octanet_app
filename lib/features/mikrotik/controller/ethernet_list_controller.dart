import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/mikrotik/models/ethernet_list_model.dart';
import 'package:Octanet/features/mikrotik/service/ethernet_list_service.dart';

class EthernetListController extends GetxController {
  RxList<EthernetList> ethernetListData = <EthernetList>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchEthernetData();
  }

  Future<void> fetchEthernetData() async {
    isLoading.value = true;
    try {
      List<EthernetList> data =
          await EthernetListService().getEthernetListData();
      ethernetListData.assignAll(data);
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
