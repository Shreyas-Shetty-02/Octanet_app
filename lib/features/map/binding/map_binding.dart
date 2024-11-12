import 'package:Octanet/features/map/controller/fiber_wire_controller.dart';
import 'package:Octanet/features/map/controller/location_controller.dart';
import 'package:Octanet/features/map/controller/master_controller.dart';
import 'package:Octanet/features/map/controller/master_wire_controller.dart';
import 'package:Octanet/features/map/controller/user_device_controller.dart';
import 'package:get/get.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FiberWireController());
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => MasterItemController());
    Get.lazyPut(() => UserDeviceController());
    Get.lazyPut(() => MasterWireController());
  }
}
