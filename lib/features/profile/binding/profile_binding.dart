import 'package:Octanet/features/profile/controller/pincode_controller.dart';
import 'package:Octanet/utlis/theme_controller.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => PincodeController());
    Get.lazyPut(() => ThemeController());
  }
}
