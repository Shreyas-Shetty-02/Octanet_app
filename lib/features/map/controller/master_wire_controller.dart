import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/map/models/master_wire_model.dart';
import 'package:Octanet/features/map/service/master_wire_service.dart';

class MasterWireController extends GetxController {
  RxList<MasterWireModel> masterWireData = <MasterWireModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchMasterWireData();
  }

  Future<void> fetchMasterWireData() async {
    isLoading.value = true;
    try {
      List<MasterWireModel> data =
          await MasterWireService().getMasterWireData();
      masterWireData.assignAll(data);
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  List<MasterWireModel> getPatchCordWires() {
    return masterWireData.where((wire) => wire.type == 'patchcords').toList();
  }

  List<MasterWireModel> getFiberCableWires() {
    return masterWireData.where((wire) => wire.type == 'fiber').toList();
  }

  List<MasterWireModel> getPLCSplitterWires() {
    return masterWireData.where((wire) => wire.type == 'spliter').toList();
  }

  List<MasterWireModel> getFBTSplitterWires() {
    return masterWireData.where((wire) => wire.type == 'coupler').toList();
  }

  List<MasterWireModel> getEthernetWires() {
    return masterWireData.where((wire) => wire.type == 'ethernet').toList();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
