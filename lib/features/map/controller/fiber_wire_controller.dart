import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/map/models/fiber_wire_model.dart';
import 'package:Octanet/features/map/service/fiber_wire_service.dart';

class FiberWireController extends GetxController {
  RxList<FiberModel> fiberWireData = <FiberModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchFiberWireData();
  }

  Future<void> fetchFiberWireData() async {
    isLoading.value = true;
    try {
      List<FiberModel> data = await FiberWireService().getFiberWireData();
      fiberWireData.assignAll(data);
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
