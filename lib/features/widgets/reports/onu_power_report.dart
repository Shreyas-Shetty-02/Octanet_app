import 'package:Octanet/features/reports/controller/onu_power_report_controller.dart';
import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ONUPowerReportContainer extends StatefulWidget {
  const ONUPowerReportContainer({super.key});

  @override
  State<ONUPowerReportContainer> createState() =>
      ONUPowerReportContainerState();
}

class ONUPowerReportContainerState extends State<ONUPowerReportContainer> {
  final TextEditingController macController = TextEditingController();
  final ONUPowerReportController onuPowerReportController =
      Get.put(ONUPowerReportController());
  final ScrollController scrollController = ScrollController();

  int itemsPerPage = 10;
  int currentPage = 1;

  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = onuPowerReportController.onuPowerReportData;
  }

  void filterData(List<dynamic> onuPowerReportData) {
    String searchTerm = macController.text.toLowerCase();
    setState(() {
      if (searchTerm.isEmpty) {
        filteredData = onuPowerReportData;
      } else {
        filteredData = onuPowerReportData.where((onuPowerReportItem) {
          return onuPowerReportItem.macAddress
              .toLowerCase()
              .contains(searchTerm);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final onuPowerReportData = onuPowerReportController.onuPowerReportData;
      int totalONUPowerReportItems = onuPowerReportData.length;
      int startONUPowerReportIndex = (currentPage - 1) * itemsPerPage;
      int endONUPowerReportIndex = startONUPowerReportIndex + itemsPerPage;
      endONUPowerReportIndex = endONUPowerReportIndex > totalONUPowerReportItems
          ? totalONUPowerReportItems
          : endONUPowerReportIndex;

      return Column(
        children: [
          Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A1A1A)
                : const Color(0xFFFFFFFF),
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ONU Power Report',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD71EFF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildTextField(
                      labeltext: 'Mac Address',
                      controller: macController,
                      keyboardType: TextInputType.text,
                      enabled: true,
                      context: context,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButtons(
                        label: 'Search',
                        onPressed: () => filterData(onuPowerReportData)),
                    const Spacer(),
                    buildButtons(
                      label: 'Clear',
                      onPressed: () {
                        macController.clear();
                        filterData(onuPowerReportData);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A1A1A)
                : const Color(0xFFFFFFFF),
            child: Column(
              children: [
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
                          horizontalInside: BorderSide(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
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
                            'Mac Address',
                          )),
                          DataColumn(
                              label: Text(
                            'Status',
                          )),
                        ],
                        rows: List<DataRow>.generate(
                          filteredData.length,
                          (index) {
                            final onuPowerReportItem = filteredData[index];
                            return DataRow(
                              cells: [
                                DataCell(Text('${index + 1}')),
                                DataCell(Text(onuPowerReportItem.macAddress)),
                                DataCell(Text(formatLineStatus(
                                    onuPowerReportItem.lineStatus))),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                  child: Row(
                    children: [
                      ItemsPerPageWidget(
                        itemsPerPage: itemsPerPage,
                        onItemsPerPageChanged: (int newValue) {
                          setState(() {
                            itemsPerPage = newValue;
                            currentPage = 1;
                          });
                        },
                      ),
                      const Spacer(),
                      PaginationWidget(
                        currentPage: currentPage,
                        totalItems: totalONUPowerReportItems,
                        itemsPerPage: itemsPerPage,
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
