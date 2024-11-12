import 'package:get/get.dart';
import 'package:Octanet/features/olt/controller/onu_controller.dart';

class OLTBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ONUController());
  }
}
