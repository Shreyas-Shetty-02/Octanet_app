import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/olt/models/onu_model.dart';
import 'package:Octanet/features/olt/service/onu_service.dart';

class ONUController extends GetxController {
  RxList<ONUResponse> onuData = <ONUResponse>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchONUData();
  }

  Future<void> fetchONUData() async {
    isLoading.value = true;
    try {
      List<ONUResponse> data = await ONUService().getONUData();
      onuData.assignAll(data);
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
