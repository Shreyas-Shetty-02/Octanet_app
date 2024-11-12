import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/base/base_model.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/map/models/user_device_model.dart';
import 'package:Octanet/features/map/service/user_device_service.dart';

class UserDeviceController extends GetxController {
  RxList<UserDevice> userDeviceData = <UserDevice>[].obs;
  RxList<UserDevice> inactiveONUs = <UserDevice>[].obs;
  RxList<String> wireModes = <String>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchUserDeviceData();
  }

  Future<void> fetchUserDeviceData() async {
    isLoading.value = true;
    try {
      List<UserDevice> data = await UserDeviceService().getUserDeviceData();
      userDeviceData.assignAll(data);
      updateInactiveONUs();
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  void updateInactiveONUs() {
    List<UserDevice> inactiveONU = [];
    for (var device in userDeviceData) {
      if (device.itemCategory == "onubox") {
        for (var connection in device.connections ?? []) {
          if (connection.wireType == 'onu') {
            var onuDevices = connection.onuDevice;
            if (onuDevices == null || onuDevices.isEmpty) {
              inactiveONU.add(device);
            } else {
              for (var onuDevice in onuDevices) {
                if (onuDevice.lineStatus == "0") {
                  inactiveONU.add(device);
                  break;
                }
              }
            }
          }
        }
      }
    }
    inactiveONUs.assignAll(inactiveONU);
  }

  void updateWireModes() {
    Set<String> modes = {};
    for (var device in userDeviceData) {
      for (var connection in device.connections ?? []) {
        if (connection.wireMode != null) {
          modes.add(connection.wireMode!);
        }
      }
    }
    wireModes.assignAll(modes.toList());
  }

  Future<bool> submitUserDeviceData(BaseModel requestData) async {
    try {
      final response = await Get.find<ApiClient>()
          .postRequest('api/device/user-device/', requestData);
      if (response.status == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
