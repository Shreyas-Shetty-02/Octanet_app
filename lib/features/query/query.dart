import 'package:Octanet/features/query/controller/query_controller.dart';
import 'package:Octanet/features/query/controller/query_link_controller.dart';
import 'package:Octanet/features/query/models/query_request_model.dart';
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/features/widgets/custom_dropdown.dart';
import 'package:Octanet/features/widgets/items_per_page.dart';
import 'package:Octanet/features/widgets/pagination.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => QueryState();
}

class QueryState extends State<Query> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPage = 1;
  int _itemsPerPage = 10;
  String? selectedVideoUrl;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    final queryController = Get.put(QueryController());
    final querylinkController = Get.put(QueryLinkController());

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Help',
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
                    const SizedBox(height: 10),
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
                    buildDrawerButton(
                      image: 'assets/Icons/reports/reports.png',
                      label: 'Reports',
                      onPressed: () {
                        Get.offAllNamed(MyRoutes.reportsRoute);
                      },
                    ),
                    buildDrawerActiveButton(
                      image: 'assets/Icons/help/help_filled.png',
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
        final queryData = queryController.queryData;
        int totalItems = queryData.length;
        int startIndex = (_currentPage - 1) * _itemsPerPage;
        int endIndex = startIndex + _itemsPerPage;
        endIndex = endIndex > totalItems ? totalItems : endIndex;

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFFFFFFF),
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Got Questions?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0xFF333333)
                                          : const Color(0xFFCCCCCC))),
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.question_mark,
                                size: 20,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'We\'ve got answers! Drop your queries, and let\'s turn uncertainties into clarity together',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            buildDropdown(
                              value: selectedType,
                              items: querylinkController.queryLinkData
                                  .map((queryLink) {
                                return DropdownMenuItem<String>(
                                  value: '${queryLink.id}',
                                  child: Text('${queryLink.name}'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value;
                                  final selectedLink = querylinkController
                                      .queryLinkData
                                      .firstWhere(
                                    (queryLink) =>
                                        '${queryLink.id}' == selectedType,
                                  );
                                  if (selectedLink.relatedVideos != null &&
                                      selectedLink.relatedVideos!.isNotEmpty) {
                                    selectedVideoUrl =
                                        selectedLink.relatedVideos!.first.link;
                                  } else {
                                    selectedVideoUrl = null;
                                  }
                                });
                              },
                              label: 'Query Type',
                              context: context,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            buildTextField(
                              keyboardType: TextInputType.text,
                              controller: questionController,
                              labeltext: 'Question',
                              enabled: true,
                              context: context,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            buildTextField(
                              keyboardType: TextInputType.text,
                              controller: detailsController,
                              labeltext: 'Details',
                              enabled: true,
                              context: context,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            buildButtons(
                                label: 'Submit', onPressed: submitForm),
                            const Spacer(),
                            buildButtons(label: 'Clear', onPressed: clearForm),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Contact for Support ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                const phoneNumber = '+91 77688 55788';
                                final uri =
                                    Uri(scheme: 'tel', path: phoneNumber);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  throw 'Could not launch ${Uri(scheme: 'tel', path: phoneNumber)}';
                                }
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all<Color>(
                                    Colors.transparent),
                                padding:
                                    WidgetStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.all(0)),
                              ),
                              child: Text(
                                '+91 77688 55788',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (selectedVideoUrl != null && selectedType != null)
                      buildYoutubePlayer(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: const Text(
                        'Query List',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD71EFF),
                        ),
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
                                color: Theme.of(context)
                                    .dataTableTheme
                                    .dataTextStyle
                                    ?.color,
                                fontSize: 14),
                            border: TableBorder(
                              top: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC)),
                              horizontalInside: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC)),
                            ),
                            dividerThickness: 0,
                            columns: const [
                              DataColumn(label: Text('Sr. No.')),
                              DataColumn(label: Text('Type')),
                              DataColumn(label: Text('Question')),
                              DataColumn(label: Text('Details')),
                            ],
                            rows: List<DataRow>.generate(
                              (endIndex - startIndex),
                              (index) {
                                final helpItem = queryData[startIndex + index];
                                return DataRow(
                                  cells: [
                                    DataCell(Text('${helpItem.id}')),
                                    DataCell(Text('${helpItem.type?.name}')),
                                    DataCell(Text('${helpItem.question}')),
                                    DataCell(Text('${helpItem.details}')),
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
        );
      }),
    );
  }

  void submitForm() {
    if (selectedType == null ||
        questionController.text.isEmpty ||
        detailsController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill out all required fields.',
        backgroundColor: const Color(0xFFEC1C24),
        colorText: Colors.white,
        borderRadius: 0,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      );
      return;
    }

    final queryController = Get.find<QueryController>();
    final Map<String, dynamic> requestData = {
      'type': selectedType!,
      'question': questionController.text,
      'details': detailsController.text,
    };

    queryController
        .submitQueryData(QueryRequest.fromJson(requestData))
        .then((response) {
      if (response) {
        selectedType = null;
        questionController.clear();
        detailsController.clear();
        Get.snackbar(
          'Success',
          'Your query has been submitted.',
          backgroundColor: const Color(0xFF009345),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
        queryController.fetchQueryData();
      } else {
        Get.snackbar(
          'Error',
          'Failed to submit your query.',
          backgroundColor: const Color(0xFFEC1C24),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      }
    });
  }

  void clearForm() {
    selectedType = null;
    questionController.clear();
    detailsController.clear();
    selectedVideoUrl = null;
  }

  Widget buildYoutubePlayer() {
    return Column(
      children: [
        YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId:
                '${YoutubePlayer.convertUrlToId(selectedVideoUrl!)}',
            flags: const YoutubePlayerFlags(autoPlay: false),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
