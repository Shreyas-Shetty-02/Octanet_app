import 'package:get/get.dart';
import 'package:Octanet/features/mikrotik/controller/mikrotik_list_controller.dart';
import 'package:Octanet/features/mikrotik/controller/active_pppoe_count_controller.dart';
import 'package:Octanet/features/mikrotik/controller/ethernet_list_controller.dart';
import 'package:Octanet/features/mikrotik/controller/pppoe_client_list_controller.dart';

class MikrotikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MikrotikListController());
    Get.lazyPut(() => ActivePPPOECountController());
    Get.lazyPut(() => EthernetListController());
    Get.lazyPut(() => PPPOEClientListController());
  }
}
