import 'package:Octanet/features/map/controller/fiber_wire_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorNameTable extends StatefulWidget {
  const ColorNameTable({super.key});

  @override
  ColorNameTableState createState() => ColorNameTableState();
}

class ColorNameTableState extends State<ColorNameTable> {
  final fiberWireController = Get.put(FiberWireController());
  bool isLoading = true;
  int currentPage = 1;
  int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 7.5),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF333333))),
            ),
            child: Text(
              'Cable Info',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0066FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              return Table(
                border: TableBorder.all(color: Color(0xFF333333)),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(75),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFFCCCCCC),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Color',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFFCCCCCC)
                                  : const Color(0xFF1A1A1A),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...fiberWireController.fiberWireData.map((fiber) {
                    return TableRow(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1A1A1A)
                            : const Color(0xFFCCCCCC),
                      ),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                            child: Container(
                              height: 10,
                              width: 10,
                              color:
                                  getColorFromWireColor(fiber.wireColor ?? ''),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              fiber.name ?? '',
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Color getColorFromWireColor(String wireColor) {
    if (wireColor.startsWith('#')) {
      return Color(int.parse('0xFF${wireColor.substring(1)}'));
    } else {
      switch (wireColor.toLowerCase()) {
        case 'white':
          return Colors.white;
        case 'red':
          return Colors.red;
        case 'green':
          return Colors.green;
        case 'blue':
          return Colors.blue;
        case 'yellow':
          return Colors.yellow;
        case 'orange':
          return Colors.orange;
        case 'purple':
          return Colors.purple;
        case 'violet':
          return const Color(0xFF7F00FF);
        case 'lime':
          return Colors.lime;
        case 'aqua':
          return const Color(0xFF00FFFF);
        default:
          return Colors.black;
      }
    }
  }
}
