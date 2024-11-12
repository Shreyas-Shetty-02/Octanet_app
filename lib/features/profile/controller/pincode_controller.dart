import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/profile/models/pincode_model.dart';
import 'package:Octanet/features/profile/service/pincode_service.dart';

class PincodeController extends GetxController {
  Rx<PincodeResponse> pincodeData = PincodeResponse().obs;
  RxList<City> cityOptions = <City>[].obs;

  RxBool isLoading = false.obs;
  Future<void> fetchPincodeData(String pincode) async {
    isLoading.value = true;
    try {
      PincodeResponse data = await PincodeService().getPincodeData(pincode);
      pincodeData.value = data;
      if (data.cityName != null) {
        cityOptions.assignAll(data.cityName!);
      }
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }
}
