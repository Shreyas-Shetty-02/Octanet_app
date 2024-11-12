import 'package:Octanet/features/reports/controller/action_report_controller.dart';
import 'package:Octanet/features/reports/controller/device_and_wire_report_controller.dart';
import 'package:Octanet/features/reports/controller/onu_power_report_controller.dart';
import 'package:get/get.dart';

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActionReportController());
    Get.lazyPut(() => DeviceAndWireReportController());
    Get.lazyPut(() => ONUPowerReportController());
  }
}
