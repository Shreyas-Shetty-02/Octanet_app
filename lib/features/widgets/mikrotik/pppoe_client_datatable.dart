import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:flutter/material.dart';

class PPPOEClientDataTable extends StatefulWidget {
  final List<dynamic> pppoeData;
  final int startPPPOEIndex;
  final int endPPPOEIndex;
  final int totalItems;
  final int currentPage;
  final int itemsPerPage;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onItemsPerPageChanged;

  const PPPOEClientDataTable({
    super.key,
    required this.pppoeData,
    required this.startPPPOEIndex,
    required this.endPPPOEIndex,
    required this.totalItems,
    required this.currentPage,
    required this.itemsPerPage,
    required this.onPageChanged,
    required this.onItemsPerPageChanged,
  });

  @override
  State<PPPOEClientDataTable> createState() => _PPPOEClientDataTableState();
}

class _PPPOEClientDataTableState extends State<PPPOEClientDataTable> {
  final TextEditingController namemacController = TextEditingController();
  final TextEditingController onuController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<dynamic> filteredData = [];
  String dropdownValue = 'All';

  @override
  void initState() {
    super.initState();
    filteredData = widget.pppoeData;
  }

  void filterData() {
    String searchTerm = namemacController.text.toLowerCase();
    String onuTerm = onuController.text.toLowerCase();
    setState(() {
      if (searchTerm.isEmpty && onuTerm.isEmpty) {
        filteredData = widget.pppoeData;
      } else {
        filteredData = widget.pppoeData.where((pppoeItem) {
          bool matchesNameOrMac =
              pppoeItem.name.toLowerCase().contains(searchTerm) ||
                  pppoeItem.macAddress.toLowerCase().contains(searchTerm);
          bool matchesOnu = pppoeItem.linkedOnu?.device?.locationName
                  ?.toLowerCase()
                  .contains(onuTerm) ??
              false;
          return matchesNameOrMac && matchesOnu;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'PPPOE Client',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD71EFF),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFFFFFFF),
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //         color: const Color(0xFFBDBDBD)),
                  //   ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton<String?>(
                  //       value: dropdownValue,
                  //       hint: const Text('Select Status'),
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           dropdownValue = newValue!;
                  //         });
                  //       },
                  //       items: <String>['All', 'Active', 'Inactive']
                  //           .map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(value),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSearchField(
                    labeltext: 'Name/MAC Address',
                    controller: namemacController,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    context: context,
                  ),
                  const SizedBox(width: 5),
                  buildSearchField(
                    labeltext: 'ONU Users',
                    controller: onuController,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    context: context,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildButtons(label: 'Search', onPressed: filterData),
                  const Spacer(),
                  buildButtons(
                    label: 'Clear',
                    onPressed: () {
                      namemacController.clear();
                      onuController.clear();
                      filterData();
                    },
                  ),
                ],
              ),
            ],
          ),
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
                    color:
                        Theme.of(context).dataTableTheme.dataTextStyle?.color,
                    fontSize: 14),
                border: TableBorder(
                  top: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF333333)
                        : const Color(0xFFCCCCCC),
                  ),
                  horizontalInside: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF333333)
                        : const Color(0xFFCCCCCC),
                  ),
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
                    'Linked User ONU',
                  )),
                  DataColumn(
                      label: Text(
                    'Tx',
                  )),
                  DataColumn(
                      label: Text(
                    'Rx',
                  )),
                  DataColumn(
                      label: Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                        Text(
                          'Map',
                        )
                      ]))),
                ],
                rows: List<DataRow>.generate(
                  filteredData.length,
                  (index) {
                    final pppoeItem = filteredData[index];
                    return DataRow(
                      cells: [
                        DataCell(Text(
                          '${index + 1}',
                        )),
                        DataCell(Text(
                          '${pppoeItem.name}',
                        )),
                        DataCell(Text(
                          pppoeItem.linkedOnu?.device?.locationName ??
                              'Unlinked',
                        )),
                        DataCell(Text(
                          convertBytes(pppoeItem.pppoeData?.txByte),
                        )),
                        DataCell(Text(
                          convertBytes(pppoeItem.pppoeData?.rxByte),
                        )),
                        DataCell(
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/Icons/map/location.png',
                              height: 24,
                              width: 24,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFFCCCCCC)
                                  : const Color(0xFF1A1A1A),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
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
                itemsPerPage: widget.itemsPerPage,
                onItemsPerPageChanged: widget.onItemsPerPageChanged,
              ),
              const Spacer(),
              PaginationWidget(
                currentPage: widget.currentPage,
                totalItems: widget.totalItems,
                itemsPerPage: widget.itemsPerPage,
                onPageChanged: widget.onPageChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
