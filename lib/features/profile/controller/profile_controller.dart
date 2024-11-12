// ignore_for_file: unnecessary_overrides
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/base/base_model.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/profile/models/profile_model.dart';
import 'package:Octanet/features/profile/service/profile_service.dart';

class ProfileController extends GetxController {
  Rx<ProfileResponse> profileData = ProfileResponse().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    isLoading.value = true;
    try {
      ProfileResponse data = await ProfileService().getProfileData();
      profileData.value = data;
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> submitProfileData(BaseModel requestData) async {
    try {
      final response = await Get.find<ApiClient>()
          .postRequest('auth/update-profile/', requestData);
      if (response.status == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
