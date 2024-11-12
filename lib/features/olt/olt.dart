import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/olt/controller/onu_controller.dart';
import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:get/get.dart';

class OLT extends StatefulWidget {
  const OLT({super.key});

  @override
  State<OLT> createState() => OLTState();
}

class OLTState extends State<OLT> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ONUController onuController = Get.put(ONUController());
  final TextEditingController userONUController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool isAllSelected = true;

  bool isPGNSSelected = false;
  bool isAllPGNSSelected = false;
  bool isPGNS1Selected = false;
  bool isPGNS2Selected = false;
  bool isPGNS3Selected = false;
  bool isPGNS4Selected = false;
  bool isPGNS5Selected = false;
  bool isPGNS6Selected = false;
  bool isPGNS7Selected = false;
  bool isPGNS8Selected = false;

  int _currentPage = 1;
  int _itemsPerPage = 10;

  List<DataRow> dataRows = [];

  @override
  void initState() {
    super.initState();
  }

  void filterData() {
    String searchValue = userONUController.text.trim().toLowerCase();
    setState(() {
      onuController.onuData.value = onuController.onuData.where((onuItem) {
        return onuItem.linkedOnu?.device?.locationName
                ?.toLowerCase()
                .contains(searchValue) ??
            false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'OLT Devices',
        scaffoldKey: _scaffoldKey,
        context: context,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Icons/drawer_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/Icons/octanet_logo.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    buildDrawerButton(
                      image: 'assets/Icons/dashboard/dashboard.png',
                      label: 'Dashboard',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.dashboardRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/map/map.png',
                      label: 'Map',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.mapRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/mikrotik/mikrotik.png',
                      label: 'Mikrotik Info',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.mikrotikRoute);
                      },
                    ),
                    buildDrawerActiveButton(
                      image: 'assets/Icons/olt/olt_filled.png',
                      label: 'OLT Devices',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.oltRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/reports/reports.png',
                      label: 'Reports',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.reportsRoute);
                      },
                    ),
                    buildDrawerButton(
                      image: 'assets/Icons/help/help.png',
                      label: 'Help',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.queryRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        final onuData = onuController.onuData;
        int totalItems = onuData.length;
        int startIndex = (_currentPage - 1) * _itemsPerPage;
        int endIndex = startIndex + _itemsPerPage;
        endIndex = endIndex > totalItems ? totalItems : endIndex;

        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF1A1A1A)
                        : const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'OLT Devices',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF1A1A1A),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isAllSelected
                                    ? const Color(0xFF0066FF)
                                    : Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFF333333)
                                        : const Color(0xFFCCCCCC),
                              ),
                            ),
                            constraints:
                                BoxConstraints.tightFor(height: 30, width: 60),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isAllSelected = true;
                                  isPGNSSelected = false;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  isAllSelected
                                      ? const Color(0xFF0066FF)
                                      : const Color(0x00FFFFFF),
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  isAllSelected
                                      ? const Color(0xFFFFFFFF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF1A1A1A),
                                ),
                                overlayColor: WidgetStateProperty.all<Color>(
                                    Colors.transparent),
                                padding:
                                    WidgetStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 4),
                                ),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                              ),
                              child: const Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isPGNSSelected
                                    ? const Color(0xFF0066FF)
                                    : Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFF333333)
                                        : const Color(0xFFCCCCCC),
                              ),
                            ),
                            constraints:
                                BoxConstraints.tightFor(height: 30, width: 60),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isAllSelected = false;
                                  isPGNSSelected = true;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  isPGNSSelected
                                      ? const Color(0xFF0066FF)
                                      : const Color(0x00FFFFFF),
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  isPGNSSelected
                                      ? const Color(0xFFFFFFFF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF1A1A1A),
                                ),
                                overlayColor: WidgetStateProperty.all<Color>(
                                    Colors.transparent),
                                padding:
                                    WidgetStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 4),
                                ),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                              ),
                              child: const Text(
                                'PGNS',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (isPGNSSelected) ...[
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isAllPGNSSelected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 40),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = true;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isAllPGNSSelected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isAllPGNSSelected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  'All',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS1Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = true;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS1Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS1Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS2Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = true;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS2Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS2Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS3Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = true;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS3Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS3Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS4Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = true;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS4Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS4Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS5Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = true;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS5Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS5Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS6Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = true;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS6Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS6Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '6',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS7Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = true;
                                    isPGNS8Selected = false;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS7Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS7Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPGNS8Selected
                                      ? const Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 30, width: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAllPGNSSelected = false;
                                    isPGNS1Selected = false;
                                    isPGNS2Selected = false;
                                    isPGNS3Selected = false;
                                    isPGNS4Selected = false;
                                    isPGNS5Selected = false;
                                    isPGNS6Selected = false;
                                    isPGNS7Selected = false;
                                    isPGNS8Selected = true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS8Selected
                                        ? const Color(0xFF0066FF)
                                        : const Color(0x00FFFFFF),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                    isPGNS8Selected
                                        ? const Color(0xFFFFFFFF)
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF1A1A1A),
                                  ),
                                  overlayColor: WidgetStateProperty.all<Color>(
                                      Colors.transparent),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 4),
                                  ),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                                child: const Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          buildTextField(
                            labeltext: 'User\'s ONU Device',
                            controller: userONUController,
                            keyboardType: TextInputType.text,
                            enabled: true,
                            context: context,
                          ),
                        ],
                      ),
                      // const SizedBox(height: 7.5),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      //         decoration: BoxDecoration(
                      //           color: const Color(0xFFFFFFFF),
                      //           borderRadius: BorderRadius.circular(8),
                      //           border: Border.all(
                      //               color: const Color(0xBE000000)),
                      //         ),
                      //         child: DropdownButtonHideUnderline(
                      //           child: DropdownButton<String>(
                      //             value: dropdownValue,
                      //             onChanged: (String? newValue) {
                      //               setState(() {
                      //                 dropdownValue = newValue!;
                      //               });
                      //             },
                      //             items: <String>[
                      //               'All',
                      //               'Online',
                      //               'Offline',
                      //               'Disconnected'
                      //             ].map<DropdownMenuItem<String>>(
                      //                 (String value) {
                      //               return DropdownMenuItem<String>(
                      //                 value: value,
                      //                 child: Text(value),
                      //               );
                      //             }).toList(),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 7.5),
                      Row(
                        children: [
                          buildButtons(label: 'Search', onPressed: filterData),
                          const Spacer(),
                          buildButtons(
                            label: 'Clear',
                            onPressed: () async {
                              userONUController.clear();
                              await onuController.fetchONUData();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF1A1A1A)
                        : const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'ONU Devices',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD71EFF),
                                  ),
                                ),
                                const Spacer(),
                                buildButtons(
                                    label: 'Refresh',
                                    onPressed: () async {
                                      await onuController.fetchONUData();
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                      ScrollbarTheme(
                        data: ScrollbarThemeData(
                          thumbColor:
                              Theme.of(context).scrollbarTheme.thumbColor,
                          trackColor:
                              Theme.of(context).scrollbarTheme.trackColor,
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
                                fontSize: 14,
                              ),
                              dataTextStyle: TextStyle(
                                color: Theme.of(context)
                                    .dataTableTheme
                                    .dataTextStyle
                                    ?.color,
                                fontSize: 14,
                              ),
                              border: TableBorder(
                                top: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                                ),
                                horizontalInside: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                                ),
                              ),
                              dividerThickness: 0,
                              columns: const [
                                DataColumn(label: Text('Sr. No.')),
                                DataColumn(label: Text('Linked ONU')),
                                DataColumn(label: Text('OLT')),
                                DataColumn(label: Text('PON')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Alive Time')),
                                DataColumn(label: Text('Distance(m)')),
                                DataColumn(label: Text('Temperature')),
                                DataColumn(label: Text('Tx Power')),
                                DataColumn(label: Text('Rx Power')),
                                DataColumn(label: Text('Last Updated')),
                              ],
                              rows: List<DataRow>.generate(
                                (endIndex - startIndex),
                                (index) {
                                  final onuItem = onuData[startIndex + index];
                                  return DataRow(
                                    cells: [
                                      DataCell(Text('${index + 1}')),
                                      DataCell(Text(onuItem.linkedOnu?.device
                                              ?.locationName ??
                                          'Not Linked')),
                                      DataCell(Text(onuItem.oltName ?? '-')),
                                      DataCell(
                                          Text(onuItem.ponPortIndex ?? '-')),
                                      DataCell(Text(formatLineStatus(
                                          onuItem.lineStatus))),
                                      DataCell(Text(getWeeksFromTime(
                                          '${onuItem.aliveTime}'))),
                                      DataCell(Text(onuItem.distance != ""
                                          ? '${onuItem.distance}'
                                          : '-')),
                                      DataCell(Text(onuItem.temperature != ""
                                          ? '${onuItem.temperature}° C'
                                          : '-')),
                                      DataCell(Text('${onuItem.txPower} dBm')),
                                      DataCell(Text('${onuItem.rxPower} dBm')),
                                      DataCell(Text(formatDateTime(
                                          '${onuItem.lastUpdated}'))),
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
                              itemsPerPage: _itemsPerPage,
                              onItemsPerPageChanged: (newValue) {
                                setState(() {
                                  _itemsPerPage = newValue;
                                });
                              },
                            ),
                            const Spacer(),
                            PaginationWidget(
                              currentPage: _currentPage,
                              totalItems: totalItems,
                              itemsPerPage: _itemsPerPage,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
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
            ),
          ),
        );
      }),
    );
  }
}
