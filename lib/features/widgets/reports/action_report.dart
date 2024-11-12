import 'package:Octanet/features/reports/controller/action_report_controller.dart';
import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/custom_dropdown.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionReport extends StatefulWidget {
  const ActionReport({super.key});

  @override
  State<ActionReport> createState() => ActionReportState();
}

class ActionReportState extends State<ActionReport> {
  String? selectedAction;
  final TextEditingController devicesController = TextEditingController();
  final TextEditingController staffController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
  final ActionReportController actionReportController =
      Get.put(ActionReportController());
  final ScrollController scrollController = ScrollController();
  int itemsPerPage = 10;
  int currentPage = 1;

  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = actionReportController.actionReportData;
  }

  void filterData(List<dynamic> actionReportData) {
    String searchDevice = devicesController.text.toLowerCase();
    String searchStaff = staffController.text.toLowerCase();
    setState(() {
      if (searchDevice.isEmpty && searchStaff.isEmpty) {
        filteredData = actionReportData;
      } else {
        filteredData = actionReportData.where((actionReportItem) {
          bool matchesDevice =
              actionReportItem.deviceName.toLowerCase().contains(searchDevice);
          bool matchesStaff = actionReportItem.actionBy != null &&
              actionReportItem.actionBy.toLowerCase().contains(searchStaff);

          return matchesDevice && matchesStaff;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final actionReportData = actionReportController.actionReportData;
      int totalActionReportItems = actionReportData.length;
      int startActionReportIndex = (currentPage - 1) * itemsPerPage;
      int endActionReportIndex = startActionReportIndex + itemsPerPage;
      endActionReportIndex = endActionReportIndex > totalActionReportItems
          ? totalActionReportItems
          : endActionReportIndex;

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
                      'Action Report',
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
                      labeltext: 'Devices',
                      controller: devicesController,
                      keyboardType: TextInputType.text,
                      enabled: true,
                      context: context,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildTextField(
                      labeltext: 'Staff',
                      controller: staffController,
                      keyboardType: TextInputType.text,
                      enabled: true,
                      context: context,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildDropdown(
                      value: selectedAction,
                      items: [
                        DropdownMenuItem<String>(
                          value: 'created_device',
                          child: Text('Device Added'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_device_info',
                          child: Text('Device Updated'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'moved_device',
                          child: Text('Device Location Changed'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'deleted_device',
                          child: Text('Device Location Deleted'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'added_connection',
                          child: Text('Connection Updated'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'added_reverse_connection',
                          child: Text('Added by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_reverse_connection',
                          child: Text('Updated by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'deleted_reverse_connection',
                          child: Text('Deleted by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_connection',
                          child: Text('Connection Updated'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'deleted_connection',
                          child: Text('Connection Deleted'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_path',
                          child: Text('Path Updated'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'added_cutbox',
                          child: Text('Device Added'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_connection_by_cutbox',
                          child: Text('Updated by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'added_connection_by_cutbox',
                          child: Text('Added Connection by Cutbox'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'make_core_free_by_cutbox',
                          child: Text('Make Core Free by Cutbox'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'make_core_free',
                          child: Text('Make Core Free'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'make_core_faulty',
                          child: Text('Make Core Faulty'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'make_core_joined',
                          child: Text('Make Core Joined'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_core_connection',
                          child: Text('Updated Core Connection'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'no_change',
                          child: Text('No Change'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'updated_core',
                          child: Text('Updated Core'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'reverse_moved_device',
                          child: Text('Updated by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'freed_reversed_core',
                          child: Text('Updated by other Device'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'reverse_updated_path',
                          child: Text('Path Updated by other Device'),
                        ),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          selectedAction = newValue!;
                        });
                      },
                      label: 'Action',
                      context: context,
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // Row(
                //   children: [
                //     DateRangeField(controller: dateRangeController),
                //   ],
                // ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    buildButtons(
                        label: 'Search',
                        onPressed: () => filterData(actionReportData)),
                    const Spacer(),
                    buildButtons(
                        label: 'Clear',
                        onPressed: () {
                          devicesController.clear();
                          staffController.clear();
                          selectedAction = null;
                          dateRangeController.clear;
                          filterData(actionReportData);
                        }),
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
                          DataColumn(label: Text('Sr. No.')),
                          DataColumn(label: Text('Date and Time')),
                          DataColumn(label: Text('Staff')),
                          DataColumn(label: Text('Device')),
                          DataColumn(label: Text('Action')),
                          DataColumn(label: Text('Changes')),
                        ],
                        rows: List<DataRow>.generate(
                          filteredData.length,
                          (index) {
                            final actionReportItem = filteredData[index];
                            return DataRow(
                              cells: [
                                DataCell(Text('${index + 1}')),
                                DataCell(Text(formatDateTime(
                                    actionReportItem.createdAt))),
                                DataCell(
                                    Text(actionReportItem.actionBy ?? '-')),
                                DataCell(
                                    Text(actionReportItem.deviceName ?? '-')),
                                DataCell(Text(
                                    formatAction(actionReportItem.action))),
                                DataCell(Text('1')),
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
                        totalItems: totalActionReportItems,
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
