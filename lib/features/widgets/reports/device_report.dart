import 'package:Octanet/features/reports/controller/device_and_wire_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceReport extends StatefulWidget {
  const DeviceReport({super.key});

  @override
  State<DeviceReport> createState() => DeviceReportState();
}

class DeviceReportState extends State<DeviceReport> {
  final DeviceAndWireReportController deviceandwireReportController =
      Get.put(DeviceAndWireReportController());
  final ScrollController scrollController = ScrollController();
  int itemsPerPage = 10;
  int currentPage = 1;

  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = deviceandwireReportController.deviceItems;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final deviceItems = deviceandwireReportController.deviceItems;
      int totalDeviceReportItems = deviceItems.length;
      int startDeviceReportIndex = (currentPage - 1) * itemsPerPage;
      int endDeviceReportIndex = startDeviceReportIndex + itemsPerPage;
      endDeviceReportIndex = endDeviceReportIndex > totalDeviceReportItems
          ? totalDeviceReportItems
          : endDeviceReportIndex;

      return Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1A1A1A)
            : const Color(0xFFFFFFFF),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 10),
                  child: Text(
                    'Device Report',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD71EFF),
                    ),
                  ),
                ),
              ],
            ),
            ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: Theme.of(context).scrollbarTheme.thumbColor,
                trackColor: Theme.of(context).scrollbarTheme.trackColor,
                thickness: WidgetStateProperty.all(5),
                crossAxisMargin: -5,
              ),
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .dataTableTheme
                            .headingTextStyle
                            ?.color,
                        fontSize: 14),
                    dataTextStyle: TextStyle(
                        color: Theme.of(context)
                            .dataTableTheme
                            .dataTextStyle
                            ?.color,
                        fontSize: 14),
                    border: TableBorder(
                      top: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF333333)
                              : const Color(0xFFCCCCCC)),
                      horizontalInside: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF333333)
                              : const Color(0xFFCCCCCC)),
                    ),
                    dividerThickness: 0,
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Sr. No.',
                      )),
                      DataColumn(
                          label: Text(
                        'Name',
                      )),
                      DataColumn(
                          label: Text(
                        'Count',
                      )),
                    ],
                    rows: List<DataRow>.generate(
                      filteredData.length,
                      (index) {
                        final deviceReportItem = filteredData[index];
                        return DataRow(
                          cells: [
                            DataCell(Text(
                              '${index + 1}',
                            )),
                            DataCell(Text(
                              deviceReportItem.name ?? '-',
                            )),
                            DataCell(Text(
                              '${deviceReportItem.count ?? '-'}',
                            )),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
