//import 'package:Octanet/features/mikrotik/controller/mikrotik_list_controller.dart';
import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/semipiechart.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:Octanet/features/dashboard/controller/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isActiveHovered = false;
  bool isEventsHovered = false;
  bool isUserDeviceHovered = false;
  bool isBNGHovered = false;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Dashboard',
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
              // colorFilter: ColorFilter.mode(Color(0x7E000000), BlendMode.multiply),
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
                    buildDrawerActiveButton(
                      image: 'assets/Icons/dashboard/dashboard_filled.png',
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
                    // buildDrawerButton(
                    //   image: 'assets/Icons/map/map.png',
                    //   label: 'S',
                    //   onPressed: () {
                    //     Get.offAllNamed(MyRoutes.sRoute);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        final dashboardData = dashboardController.dashboardData.value;
        //final MikrotikListController mikrotikListController = Get.put(MikrotikListController());
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveHovered = !isActiveHovered;
                      isEventsHovered = false;
                      isUserDeviceHovered = false;
                      isBNGHovered = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFFFFFFFF),
                      border: isActiveHovered
                          ? Border.all(color: const Color(0xFF009345))
                          : Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF1A1A1A)
                                  : const Color(0xFFFFFFFF),
                            ),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Active',
                                  style: TextStyle(
                                      color: const Color(0xFF009345),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  'assets/Icons/dashboard/dashboard_active.png',
                                  color: isActiveHovered
                                      ? Color(0xFF009345)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF000000),
                                  height: 40,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'OLT Active:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${dashboardData.olt?.total ?? '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ONU Active:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${dashboardData.onu?.active ?? '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ONU Inactive:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${dashboardData.onu?.inactive ?? '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Switch:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Router:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEventsHovered = !isEventsHovered;
                      isActiveHovered = false;
                      isUserDeviceHovered = false;
                      isBNGHovered = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFFFFFFFF),
                      border: isEventsHovered
                          ? Border.all(color: const Color(0xFFEC1C24))
                          : Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF1A1A1A)
                                  : const Color(0xFFFFFFFF),
                            ),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Events',
                                  style: TextStyle(
                                      color: const Color(0xFFEC1C24),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  'assets/Icons/dashboard/dashboard_events.png',
                                  color: isEventsHovered
                                      ? Color(0xFFEC1C24)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF000000),
                                  height: 30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ONU Down:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${dashboardData.onu?.down ?? '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Power Loss:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cable Cut:',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isUserDeviceHovered = !isUserDeviceHovered;
                      isActiveHovered = false;
                      isEventsHovered = false;
                      isBNGHovered = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFFFFFFFF),
                      border: isUserDeviceHovered
                          ? Border.all(color: const Color(0xFFF16522))
                          : Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF1A1A1A)
                                  : const Color(0xFFFFFFFF),
                            ),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'User Device',
                                  style: TextStyle(
                                      color: const Color(0xFFF16522),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  'assets/Icons/dashboard/dashboard_userdevice.png',
                                  color: isUserDeviceHovered
                                      ? Color(0xFFF16522)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF000000),
                                  height: 40,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SemicirclePieChart(
                              data: [
                                (dashboardData.device?.devices[0].count)
                                        ?.toDouble() ??
                                    0.0,
                                (dashboardData.device?.devices[1].count)
                                        ?.toDouble() ??
                                    0.0,
                              ],
                              colors: [
                                isUserDeviceHovered
                                    ? Color(0xFF0066FF)
                                    : Color(0xFF999999),
                                isUserDeviceHovered
                                    ? Color(0xFFD71EFF)
                                    : Color(0xFFE6E6E6),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: isUserDeviceHovered
                                          ? Color(0xFF0066FF)
                                          : Color(0xFF999999),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${dashboardData.device?.devices.isNotEmpty == true ? dashboardData.device?.devices[0].name : '-'}:',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${dashboardData.device?.devices.isNotEmpty == true ? dashboardData.device?.devices[0].count : '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: isUserDeviceHovered
                                          ? Color(0xFFD71EFF)
                                          : Color(0xFFE6E6E6),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${dashboardData.device?.devices.isNotEmpty == true ? dashboardData.device?.devices[1].name : '-'}:',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF000000),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${dashboardData.device?.devices.isNotEmpty == true ? dashboardData.device?.devices[1].count : '-'}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '${dashboardData.wire?.wires.isNotEmpty == true ? dashboardData.wire?.wires[0].name : '-'}:',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  dashboardData.wire?.wires.isNotEmpty == true
                                      ? '${dashboardData.wire?.wires[0].distance} km'
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '${dashboardData.wire?.wires.isNotEmpty == true ? dashboardData.wire?.wires[1].name : '-'}:',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  dashboardData.wire?.wires.isNotEmpty == true
                                      ? '${dashboardData.wire?.wires[1].distance} km'
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBNGHovered = !isBNGHovered;
                      isActiveHovered = false;
                      isEventsHovered = false;
                      isUserDeviceHovered = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFFFFFFFF),
                      border: isBNGHovered
                          ? Border.all(color: const Color(0xFF0066FF))
                          : Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF1A1A1A)
                                  : const Color(0xFFFFFFFF),
                            ),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BNG 103.87.65.254',
                                  //'BNG ${mikrotikListController.mikrotikListData[0].ipAddress}',
                                  style: TextStyle(
                                      color: const Color(0xFF0066FF),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  'assets/Icons/dashboard/dashboard_mikrotik.png',
                                  color: isBNGHovered
                                      ? Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF000000),
                                  height: 40,
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              height: 27.5,
                              child: LinearProgressIndicator(
                                value:
                                    dashboardData.mikrotikData?.cpuLoad != null
                                        ? int.tryParse(dashboardData
                                                .mikrotikData!.cpuLoad)! /
                                            100
                                        : 0.0,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF333333)
                                    : const Color(0xFFE6E6E6),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isBNGHovered
                                      ? Color(0xFF0066FF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF999999),
                                ),
                              ),
                            ),
                            const SizedBox(height: 27.5),
                            SizedBox(
                              width: double.infinity,
                              height: 27.5,
                              child: LinearProgressIndicator(
                                value: dashboardData.mikrotikData?.freeMemory !=
                                            null &&
                                        dashboardData
                                                .mikrotikData?.totalMemory !=
                                            null
                                    ? 0.0 +
                                        (getUsedMemoryPercentage(
                                                dashboardData
                                                    .mikrotikData!.freeMemory,
                                                dashboardData.mikrotikData!
                                                    .totalMemory) /
                                            100)
                                    : 0.0,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF333333)
                                    : const Color(0xFFE6E6E6),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isBNGHovered
                                      ? Color(0xFFD71EFF)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF999999),
                                ),
                              ),
                            ),
                            const SizedBox(height: 27.5),
                            SizedBox(
                              width: double.infinity,
                              height: 27.5,
                              child: LinearProgressIndicator(
                                value:
                                    dashboardData.mikrotikData?.freeHddSpace !=
                                                null &&
                                            dashboardData.mikrotikData
                                                    ?.totalHddSpace !=
                                                null
                                        ? 0.0 +
                                            (getUsedHDDPercentage(
                                                    dashboardData.mikrotikData!
                                                        .freeHddSpace,
                                                    dashboardData.mikrotikData!
                                                        .totalHddSpace) /
                                                100)
                                        : 0.0,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF333333)
                                    : const Color(0xFFE6E6E6),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isBNGHovered
                                      ? Color(0xFF8BC53F)
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFFCCCCCC)
                                          : const Color(0xFF999999),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Uptime:',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  dashboardData.mikrotikData?.uptime != null
                                      ? getWeeksFromTime(
                                          dashboardData.mikrotikData!.uptime)
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: isBNGHovered
                                          ? Color(0xFF0066FF)
                                          : Color(0xFF999999),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Used CPU:',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xFFCCCCCC)
                                            : const Color(0xFF000000),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  dashboardData.mikrotikData?.cpuLoad != null
                                      ? '${dashboardData.mikrotikData!.cpuLoad}%'
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: isBNGHovered
                                          ? Color(0xFFD71EFF)
                                          : Color(0xFF999999),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Used Memory:',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  dashboardData.mikrotikData?.freeMemory !=
                                              null &&
                                          dashboardData
                                                  .mikrotikData?.totalMemory !=
                                              null
                                      ? '${getUsedMemoryPercentage(dashboardData.mikrotikData!.freeMemory, dashboardData.mikrotikData!.totalMemory)}%'
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: isBNGHovered
                                          ? Color(0xFF8BC53F)
                                          : Color(0xFF999999),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Used HHD:',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  dashboardData.mikrotikData?.freeHddSpace !=
                                              null &&
                                          dashboardData.mikrotikData
                                                  ?.totalHddSpace !=
                                              null
                                      ? '${getUsedHDDPercentage(dashboardData.mikrotikData!.freeHddSpace, dashboardData.mikrotikData!.totalHddSpace)}%'
                                      : '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
