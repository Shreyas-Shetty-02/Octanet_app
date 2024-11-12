import 'package:Octanet/utlis/theme_controller.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ThemeController());
  }
}
