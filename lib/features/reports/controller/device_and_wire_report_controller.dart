import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/reports/models/device_and_wire_report_model.dart';
import 'package:Octanet/features/reports/service/device_and_wire_report_service.dart';
import 'package:flutter/material.dart';

class DeviceAndWireReportController extends GetxController {
  RxList<DeviceItem> deviceItems = <DeviceItem>[].obs;
  RxList<WireItem> wireItems = <WireItem>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDeviceItems();
    fetchWireItems();
  }

  Future<void> fetchDeviceItems() async {
    isLoading(true);
    hasError(false);
    try {
      List<DeviceItem> data = await DeviceReportService().getDeviceReportData();
      deviceItems.assignAll(data);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      hasError(true);
      Get.snackbar(
        'Error',
        'Failed to load Device Report data.',
        backgroundColor: const Color(0xFFEC1C24),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchWireItems() async {
    isLoading(true);
    hasError(false);
    try {
      List<WireItem> data = await WireReportService().getWireReportData();
      wireItems.assignAll(data);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      hasError(true);
      Get.snackbar(
        'Error',
        'Failed to load Wire Report data.',
        backgroundColor: const Color(0xFFEC1C24),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
    } finally {
      isLoading(false);
    }
  }
}
