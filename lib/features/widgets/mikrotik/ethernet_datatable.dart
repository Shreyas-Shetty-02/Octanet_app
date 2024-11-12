import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EthernetDataTable extends StatefulWidget {
  final List<dynamic> ethernetData;
  final int startEthernetIndex;
  final int endEthernetIndex;
  final int totalItems;
  final int currentPage;
  final int itemsPerPage;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onItemsPerPageChanged;

  const EthernetDataTable({
    super.key,
    required this.ethernetData,
    required this.startEthernetIndex,
    required this.endEthernetIndex,
    required this.totalItems,
    required this.currentPage,
    required this.itemsPerPage,
    required this.onPageChanged,
    required this.onItemsPerPageChanged,
  });

  @override
  State<EthernetDataTable> createState() => _EthernetDataTableState();
}

class _EthernetDataTableState extends State<EthernetDataTable> {
  final TextEditingController namemacController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = widget.ethernetData;
  }

  void filterData() {
    String searchTerm = namemacController.text.toLowerCase();
    setState(() {
      if (searchTerm.isEmpty) {
        filteredData = widget.ethernetData;
      } else {
        filteredData = widget.ethernetData.where((ethernetItem) {
          return ethernetItem.name.toLowerCase().contains(searchTerm) ||
              ethernetItem.macAddress.toLowerCase().contains(searchTerm);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ethernet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD71EFF),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildSearchField(
                    labeltext: 'Name OR MAC Address',
                    controller: namemacController,
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
                  DataColumn(label: Text('Sr. No.')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('MAC Address')),
                  DataColumn(label: Text('Tx')),
                  DataColumn(label: Text('Rx')),
                ],
                rows: List<DataRow>.generate(
                  filteredData.length,
                  (index) {
                    final ethernetItem = filteredData[index];
                    return DataRow(
                      cells: [
                        DataCell(Text(
                          '${index + 1}',
                        )),
                        DataCell(Text(
                          '${ethernetItem.name}',
                        )),
                        DataCell(Text(
                          ethernetItem.macAddress,
                        )),
                        DataCell(Text(
                          convertBytes(ethernetItem.extraData?.txByte),
                        )),
                        DataCell(Text(
                          convertBytes(ethernetItem.extraData?.rxByte),
                        )),
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
