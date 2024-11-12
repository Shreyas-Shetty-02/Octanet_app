import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/widgets/reports/action_report.dart';
import 'package:Octanet/features/widgets/reports/device_report.dart';
import 'package:Octanet/features/widgets/reports/onu_power_report.dart';
import 'package:Octanet/features/widgets/reports/wire_report.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:get/get.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedAction = 'Action';
  int selectedContainerIndex = 0;
  int itemsPerPage = 10;
  int currentPage = 1;

  final TextEditingController macController = TextEditingController();
  final TextEditingController devicesController = TextEditingController();
  final TextEditingController staffController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void switchContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Reports',
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
                    buildDrawerButton(
                      image: 'assets/Icons/olt/olt.png',
                      label: 'OLT Devices',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.oltRoute);
                      },
                    ),
                    buildDrawerActiveButton(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                ),
                child: Table(
                  border: TableBorder.symmetric(
                      inside: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF333333)
                              : const Color(0xFFCCCCCC))),
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment.intrinsicHeight,
                  children: [
                    TableRow(
                      children: [
                        drawerButton(
                          label: 'Action Report',
                          onPressed: () => switchContainer(0),
                          isSelected: selectedContainerIndex == 0,
                        ),
                        drawerButton(
                          label: 'Device Report',
                          onPressed: () => switchContainer(1),
                          isSelected: selectedContainerIndex == 1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        drawerButton(
                          label: 'Wire Report',
                          onPressed: () => switchContainer(2),
                          isSelected: selectedContainerIndex == 2,
                        ),
                        drawerButton(
                          label: 'ONU Power Report',
                          onPressed: () => switchContainer(3),
                          isSelected: selectedContainerIndex == 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  if (selectedContainerIndex == 0) ActionReport(),
                  if (selectedContainerIndex == 1) DeviceReport(),
                  if (selectedContainerIndex == 2) WireReport(),
                  if (selectedContainerIndex == 3) ONUPowerReportContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerButton({
    required String label,
    required VoidCallback onPressed,
    required bool isSelected,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return isSelected
                ? const Color(0xFF0066FF)
                : const Color(0xFFFFFFFF);
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return isSelected
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF000000);
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
