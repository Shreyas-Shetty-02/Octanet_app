import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/map/controller/location_controller.dart';
import 'package:Octanet/features/map/controller/user_device_controller.dart';
import 'package:Octanet/features/widgets/map/add_device_dialog.dart';
import 'package:Octanet/features/widgets/map/color_table.dart';
import 'package:Octanet/features/widgets/map/icon_buttons.dart';
import 'package:Octanet/features/widgets/map/inactive_onu_popup.dart';
import 'package:Octanet/features/widgets/map/dialog_box.dart';
import 'package:Octanet/features/widgets/map/layer_menu.dart';
import 'package:Octanet/features/widgets/markers.dart';
import 'package:Octanet/features/widgets/permissions.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/features/widgets/app_bar.dart';
import 'package:Octanet/features/widgets/side_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController locNameController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController locNameResponseController =
      TextEditingController();
  final TextEditingController wireTypeResponseController =
      TextEditingController();
  final TextEditingController loopResponseController = TextEditingController();
  final TextEditingController wireModeResponseController =
      TextEditingController();
  final TextEditingController wireCodeResponseController =
      TextEditingController();
  final TextEditingController descriptionResponseController =
      TextEditingController();

  final userDeviceController = Get.put(UserDeviceController());

  GoogleMapController? mapController;
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(19.69523, 72.76880), zoom: 16);
  MapType currentMapType = MapType.normal;
  LocationController locationController = Get.put(LocationController());
  LatLng? userLocation;
  final Set<Marker> setmarkers = {};

  String? deviceValue;
  String? wireTypeValue;
  String? itemTypeValue;

  @override
  void initState() {
    super.initState();
    getUserLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userDeviceController.fetchUserDeviceData().then((_) {
        addMarkers();
      });
    });
  }

  Future<void> addMarkers() async {
    await addMarker(
        setmarkers, userDeviceController.userDeviceData, setState, context);
  }

  void onMapTypeChanged(MapType? selectedMapType) {
    setState(() {
      currentMapType = selectedMapType!;
    });
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return showLocationPermissionDeniedDialog(context);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    userLocation = LatLng(position.latitude, position.longitude);
    setState(() {
      initialPosition = CameraPosition(target: userLocation!, zoom: 16);
    });
  }

  bool isPointInPolygon(LatLng point, List<LatLng> polygonVertices) {
    int intersectCount = 0;
    for (int j = 0; j < polygonVertices.length - 1; j++) {
      LatLng vertex1 = polygonVertices[j];
      LatLng vertex2 = polygonVertices[j + 1];

      if ((vertex1.longitude > point.longitude) !=
              (vertex2.longitude > point.longitude) &&
          (point.latitude <
              (vertex2.latitude - vertex1.latitude) *
                      (point.longitude - vertex1.longitude) /
                      (vertex2.longitude - vertex1.longitude) +
                  vertex1.latitude)) {
        intersectCount++;
      }
    }
    return (intersectCount % 2) == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        title: 'Map',
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
                    buildDrawerActiveButton(
                      image: 'assets/Icons/map/map_filled.png',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Obx(() => GoogleMap(
                    initialCameraPosition: userLocation == null
                        ? initialPosition
                        : CameraPosition(target: userLocation!, zoom: 16),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: true,
                    mapType: currentMapType,
                    polygons: locationController.polygons.toSet(),
                    markers: setmarkers,
                    onLongPress: (LatLng position) {
                      bool isInsidePolygon = false;
                      for (final polygon in locationController.polygons) {
                        if (isPointInPolygon(position, polygon.points)) {
                          isInsidePolygon = true;
                          break;
                        }
                      }
                      if (isInsidePolygon) {
                        showAddDeviceonMapDialog(position);
                      } else {
                        showOutsidePolygonDialog(context);
                      }
                    },
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildMapButtons(
                        image: 'assets/Icons/map/add_device.png',
                        onPressed: showAddDeviceDialog),
                    const SizedBox(width: 5),
                    InactiveONUWidget(
                      mapController: mapController,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextSelectionTheme(
                        data: const TextSelectionThemeData(
                          selectionColor: Color(0x33000000),
                          selectionHandleColor: Color(0xFF808080),
                        ),
                        child: SizedBox(
                          height: 35,
                          child: TextField(
                            controller: searchController,
                            cursorColor: const Color(0xBE000000),
                            style: const TextStyle(
                              color: Color(0xFF1A1A1A),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: Color(0xFF999999),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 12.5,
                              ),
                              suffixIcon: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/Icons/map/search.png',
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints.tightFor(
                                  width: 30, height: 30),
                            ),
                            obscureText: false,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    buildMapButtons(
                        image: 'assets/Icons/map/reload.png',
                        onPressed: () async {
                          await userDeviceController.fetchUserDeviceData();
                        }),
                    const SizedBox(width: 5),
                    buildMapButtons(
                      image: 'assets/Icons/map/menu.png',
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ColorNameTable();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      color: const Color(0xFFFFFFFF),
                      child: PopupMenuButton<MapType>(
                        icon: Image.asset(
                          'assets/Icons/map/layers.png',
                          height: 20,
                          width: 20,
                          color: const Color(0xFF1A1A1A),
                        ),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1A1A1A)
                            : const Color(0xFFFFFFFF),
                        offset: const Offset(0, 40),
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        onSelected: onMapTypeChanged,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            height: 20,
                            value: MapType.normal,
                            child: Center(
                              child: Text(
                                'Default',
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF1A1A1A),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const ColoredPopupMenuDivider(
                              color: Color(0xFF333333)),
                          PopupMenuItem(
                            height: 20,
                            value: MapType.satellite,
                            child: Center(
                              child: Text(
                                'Satellite',
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF1A1A1A),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const ColoredPopupMenuDivider(
                              color: Color(0xFF333333)),
                          PopupMenuItem(
                            height: 20,
                            value: MapType.terrain,
                            child: Center(
                              child: Text(
                                'Terrain',
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF1A1A1A),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const ColoredPopupMenuDivider(
                              color: Color(0xFF333333)),
                          PopupMenuItem(
                            height: 20,
                            value: MapType.hybrid,
                            child: Center(
                              child: Text(
                                'Hybrid',
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF1A1A1A),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildMapButtons(
                      image: 'assets/Icons/map/my_location.png',
                      onPressed: () async {
                        if (userLocation != null) {
                          mapController?.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: userLocation!,
                                zoom: 16,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildMapButtons(
                      image: 'assets/Icons/map/zoom_in.png',
                      onPressed: () async {
                        mapController?.animateCamera(
                          CameraUpdate.zoomIn(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      color: const Color(0xFFFFFFFF),
                      child: IconButton(
                        onPressed: () async {
                          mapController?.animateCamera(
                            CameraUpdate.zoomOut(),
                          );
                        },
                        icon: Image.asset(
                          'assets/Icons/map/zoom_out.png',
                          width: 15,
                          color: Color(0xFF1A1A1A),
                        ),
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAddDeviceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDeviceDialog(
          locNameController: locNameController,
          latController: latController,
          longController: longController,
          locNameResponseController: locNameResponseController,
          wireTypeResponseController: wireTypeResponseController,
          loopResponseController: loopResponseController,
          wireModeResponseController: wireModeResponseController,
          wireCodeResponseController: wireCodeResponseController,
          descriptionResponseController: descriptionResponseController,
          deviceValue: deviceValue,
          wireTypeValue: wireTypeValue,
          itemTypeValue: itemTypeValue,
          onDeviceChanged: (String? newValue) {
            setState(() {
              deviceValue = newValue!;
            });
          },
          onWireTypeChanged: (String? newValue) {
            setState(() {
              wireTypeValue = newValue!;
            });
          },
          onItemTypeChanged: (String? newValue) {
            setState(() {
              itemTypeValue = newValue!;
            });
          },
        );
      },
    );
  }

  void showAddDeviceonMapDialog(LatLng position) {
    latController.text = position.latitude.toString();
    longController.text = position.longitude.toString();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDeviceDialog(
          locNameController: locNameController,
          latController: latController,
          longController: longController,
          locNameResponseController: locNameResponseController,
          wireTypeResponseController: wireTypeResponseController,
          loopResponseController: loopResponseController,
          wireModeResponseController: wireModeResponseController,
          wireCodeResponseController: wireCodeResponseController,
          descriptionResponseController: descriptionResponseController,
          deviceValue: deviceValue,
          wireTypeValue: wireTypeValue,
          itemTypeValue: itemTypeValue,
          onDeviceChanged: (String? newValue) {
            setState(() {
              deviceValue = newValue!;
            });
          },
          onWireTypeChanged: (String? newValue) {
            setState(() {
              wireTypeValue = newValue!;
            });
          },
          onItemTypeChanged: (String? newValue) {
            setState(() {
              itemTypeValue = newValue!;
            });
          },
        );
      },
    );
  }
}
