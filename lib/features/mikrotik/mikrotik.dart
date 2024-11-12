import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/mikrotik/controller/active_pppoe_count_controller.dart';
import 'package:Octanet/features/mikrotik/controller/ethernet_list_controller.dart';
import 'package:Octanet/features/mikrotik/controller/mikrotik_list_controller.dart';
import 'package:Octanet/features/mikrotik/controller/mikrotik_log_controller.dart';
import 'package:Octanet/features/mikrotik/controller/pppoe_client_list_controller.dart';
import 'package:Octanet/features/widgets/converters.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/map/icon_buttons.dart';
import 'package:Octanet/features/widgets/mikrotik/ethernet_datatable.dart';
import 'package:Octanet/features/widgets/mikrotik/pppoe_client_datatable.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:get/get.dart';
import 'package:dart_ping/dart_ping.dart';

class Mikrotik extends StatefulWidget {
  const Mikrotik({super.key});

  @override
  State<Mikrotik> createState() => MikrotikState();
}

class MikrotikState extends State<Mikrotik> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  bool isAllSelected = true;
  bool isIPSelected = false;
  bool showPPPOEClientTable = true;
  String dropdownValue = 'All';
  int itemsPerPage = 10;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MikrotikListController mikrotikListController =
        Get.put(MikrotikListController());
    final ActivePPPOECountController activePPPOECountController =
        Get.put(ActivePPPOECountController());
    final MikrotikLogController mikrotikLogController =
        Get.put(MikrotikLogController());
    final PPPOEClientListController pppoeClientListController =
        Get.put(PPPOEClientListController());
    final EthernetListController ethernetClientListController =
        Get.put(EthernetListController());

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Mikrotik Info',
        scaffoldKey: scaffoldKey,
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
                    buildDrawerActiveButton(
                      image: 'assets/Icons/mikrotik/mikrotik_filled.png',
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () {
          final activePPPOEData =
              activePPPOECountController.activePPPOECountData.value;

          final mikrotikLog = mikrotikLogController.mikrotikLogData.value;

          final pppoeData = pppoeClientListController.pppoeClientListData;
          int totalPPPOEItems = pppoeData.length;
          int startPPPOEIndex = (currentPage - 1) * itemsPerPage;
          int endPPPOEIndex = startPPPOEIndex + itemsPerPage;
          endPPPOEIndex =
              endPPPOEIndex > totalPPPOEItems ? totalPPPOEItems : endPPPOEIndex;

          final ethernetData = ethernetClientListController.ethernetListData;
          int totalEthernetItems = ethernetData.length;
          int startEthernetIndex = (currentPage - 1) * itemsPerPage;
          int endEthernetIndex = startEthernetIndex + itemsPerPage;
          endEthernetIndex = endEthernetIndex > totalEthernetItems
              ? totalEthernetItems
              : endEthernetIndex;
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.zero,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Mikrotik',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF000000),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.5, horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF333333)
                                    : const Color(0xFFCCCCCC)),
                          ),
                          child: Text(
                            'Active Users: ${activePPPOEData.activePPPOECount}/${activePPPOEData.allPPPOECount}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFFCCCCCC)
                                  : const Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                isIPSelected = false;
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
                                const EdgeInsets.all(5),
                              ),
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                            ),
                            child: const Text(
                              'All',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isIPSelected
                                  ? const Color(0xFF0066FF)
                                  : Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                            ),
                          ),
                          constraints: BoxConstraints.tightFor(height: 30),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isAllSelected = false;
                                isIPSelected = true;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                isIPSelected
                                    ? const Color(0xFF0066FF)
                                    : const Color(0x00FFFFFF),
                              ),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                isIPSelected
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
                                const EdgeInsets.all(5),
                              ),
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                            ),
                            child: Text(
                              '${mikrotikListController.mikrotikListData[0].ipAddress}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isIPSelected) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Uptime: ',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                getWeeksFromTime(mikrotikListController
                                    .mikrotikListData[0].mikrotikData?.uptime),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Used Memory: ',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                '${getUsedMemoryPercentage(mikrotikListController.mikrotikListData[0].mikrotikData?.freeMemory, mikrotikListController.mikrotikListData[0].mikrotikData?.totalMemory)}%',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'CPU Load: ',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                '${mikrotikListController.mikrotikListData[0].mikrotikData!.cpuLoad}%',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Used HHD Space: ',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                '${getUsedHDDPercentage(mikrotikListController.mikrotikListData[0].mikrotikData?.freeHddSpace, mikrotikListController.mikrotikListData[0].mikrotikData?.totalHddSpace)}%',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Active Users: ',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                              Text(
                                '${mikrotikListController.mikrotikListData[0].activePppoes} / ${mikrotikListController.mikrotikListData[0].allPppoes}',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              buildButtons(
                                label: 'Ping',
                                onPressed: () async {
                                  final ping = Ping(
                                      '${mikrotikListController.mikrotikListData[0].ipAddress}',
                                      count: 1);
                                  ping.stream.listen((event) {
                                    if (event.response != null) {
                                      Get.snackbar(
                                        'Success',
                                        'IP ${mikrotikListController.mikrotikListData[0].ipAddress} has been successfully pinged.',
                                        backgroundColor:
                                            const Color(0xFF009345),
                                        colorText: Colors.white,
                                        borderRadius: 0,
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'IP ${mikrotikListController.mikrotikListData[0].ipAddress} is not reachable.',
                                        backgroundColor:
                                            const Color(0xFFEC1C24),
                                        colorText: Colors.white,
                                        borderRadius: 0,
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                      );
                                    }
                                  });
                                },
                              ),
                              const Spacer(),
                              buildButtons(
                                label: 'Logs',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? const Color(0xFF1A1A1A)
                                                    : const Color(0xFFFFFFFF),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '${mikrotikListController.mikrotikListData[0].ipAddress} logs',
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.color,
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        )),
                                                    const Spacer(),
                                                    bigCloseButton(
                                                        context: context),
                                                  ],
                                                ),
                                              ),
                                              ScrollbarTheme(
                                                data: ScrollbarThemeData(
                                                  thumbColor: Theme.of(context)
                                                      .scrollbarTheme
                                                      .thumbColor,
                                                  trackColor: Theme.of(context)
                                                      .scrollbarTheme
                                                      .trackColor,
                                                  thickness:
                                                      WidgetStateProperty.all(
                                                          5),
                                                  crossAxisMargin: -5,
                                                ),
                                                child: Scrollbar(
                                                  controller: scrollController,
                                                  thumbVisibility: true,
                                                  trackVisibility: true,
                                                  child: SingleChildScrollView(
                                                    controller:
                                                        scrollController,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: DataTable(
                                                      headingTextStyle:
                                                          TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .dataTableTheme
                                                            .headingTextStyle
                                                            ?.color,
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                      dataTextStyle: TextStyle(
                                                        color: Theme.of(context)
                                                            .dataTableTheme
                                                            .dataTextStyle
                                                            ?.color,
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                      border: TableBorder(
                                                        top: BorderSide(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? const Color(
                                                                  0xFF333333)
                                                              : const Color(
                                                                  0xFFCCCCCC),
                                                        ),
                                                        horizontalInside:
                                                            BorderSide(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? const Color(
                                                                  0xFF333333)
                                                              : const Color(
                                                                  0xFFCCCCCC),
                                                        ),
                                                      ),
                                                      dividerThickness: 0,
                                                      columns: const [
                                                        DataColumn(
                                                            label: Text(
                                                                'Sr. No.')),
                                                        DataColumn(
                                                            label:
                                                                Text('Time')),
                                                        DataColumn(
                                                            label:
                                                                Text('Topic')),
                                                        DataColumn(
                                                            label: Text(
                                                                'Message')),
                                                      ],
                                                      rows: [
                                                        DataRow(cells: [
                                                          DataCell(Text(
                                                              mikrotikLog.id ??
                                                                  '-')),
                                                          DataCell(Text(
                                                              mikrotikLog
                                                                      .time ??
                                                                  '-')),
                                                          DataCell(Text(
                                                              mikrotikLog
                                                                      .topics ??
                                                                  '-')),
                                                          DataCell(Text(
                                                              mikrotikLog
                                                                      .message ??
                                                                  '-')),
                                                        ]),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showPPPOEClientTable = true;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                !showPPPOEClientTable
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF0066FF),
                              ),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                !showPPPOEClientTable
                                    ? const Color(0xFF000000)
                                    : const Color(0xFFFFFFFF),
                              ),
                              overlayColor: WidgetStateProperty.all<Color>(
                                Colors.transparent,
                              ),
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                          child: const Text(
                            'PPPOE Client',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showPPPOEClientTable = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                !showPPPOEClientTable
                                    ? const Color(0xFF0066FF)
                                    : const Color(0xFFCCCCCC),
                              ),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                !showPPPOEClientTable
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF000000),
                              ),
                              overlayColor: WidgetStateProperty.all<Color>(
                                Colors.transparent,
                              ),
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                          child: const Text(
                            'Ethernet',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  showPPPOEClientTable
                      ? PPPOEClientDataTable(
                          pppoeData: pppoeData,
                          startPPPOEIndex: startPPPOEIndex,
                          endPPPOEIndex: endPPPOEIndex,
                          totalItems: totalPPPOEItems,
                          currentPage: currentPage,
                          itemsPerPage: itemsPerPage,
                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          onItemsPerPageChanged: (int newValue) {
                            setState(() {
                              itemsPerPage = newValue;
                              currentPage = 1;
                            });
                          },
                        )
                      : EthernetDataTable(
                          ethernetData: ethernetData,
                          startEthernetIndex: startEthernetIndex,
                          endEthernetIndex: endEthernetIndex,
                          totalItems: totalEthernetItems,
                          currentPage: currentPage,
                          itemsPerPage: itemsPerPage,
                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          onItemsPerPageChanged: (int newValue) {
                            setState(() {
                              itemsPerPage = newValue;
                              currentPage = 1;
                            });
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
