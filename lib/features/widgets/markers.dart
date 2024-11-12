import 'package:Octanet/features/map/models/user_device_model.dart' as model;
import 'package:Octanet/features/widgets/map/view_device_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> addMarker(
    Set<Marker> markers,
    List<model.UserDevice> userDeviceData,
    Function setState,
    BuildContext context) async {
  final icons = {
    'Bumboo Encloser': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/bumboo_encloser.png',
    ),
    '6U Network Rack': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/6U_network_rack.png',
    ),
    '24 Port Fiber Patch Panel': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/fiber_patch_panel.png',
    ),
    'FTTH BOX': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/ftth_box.png',
    ),
    'LI BOX 2 Way': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/li_box_2_way.png',
    ),
    'LI BOX 4 Way': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/li_box_4_way.png',
    ),
    'ONU': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/onu.png',
    ),
    'Switch': await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(25, 25)),
      'assets/Images/network_switch.png',
    ),
  };

  void addMarkers(String itemName, BitmapDescriptor icon) {
    final devices =
        userDeviceData.where((device) => device.itemName == itemName).toList();
    for (var device in devices) {
      if (device.latitude != null && device.longitude != null) {
        double? lat = double.tryParse(device.latitude!);
        double? lng = double.tryParse(device.longitude!);
        markers.add(
          Marker(
            markerId: MarkerId('${device.itemName!}${device.latitude}'),
            position: LatLng(lat!, lng!),
            icon: icon,
            onTap: () {
              showAddDeviceDialog(device, context);
            },
          ),
        );
      }
    }
  }

  setState(() {
    addMarkers('Bumboo Encloser-24F', icons['Bumboo Encloser']!);
    addMarkers('6U Network Rack', icons['6U Network Rack']!);
    addMarkers(
        '24 Port Fiber Patch Panel', icons['24 Port Fiber Patch Panel']!);
    addMarkers('FTTH BOX', icons['FTTH BOX']!);
    addMarkers('LI BOX 2 Way', icons['LI BOX 2 Way']!);
    addMarkers('LI BOX 4 Way', icons['LI BOX 4 Way']!);
    addMarkers('ONU', icons['ONU']!);
    addMarkers('Switch', icons['Switch']!);
  });
}

void showAddDeviceDialog(model.UserDevice userDevice, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ViewDeviceDialog(
        itemIcon: 'https://stagingapi.octanet.tech${userDevice.itemIcon}',
        locNameController: TextEditingController(text: userDevice.locationName),
        locNameResponseController: TextEditingController(),
        wireTypeResponseController: TextEditingController(),
        loopResponseController: TextEditingController(),
        wireModeResponseController: TextEditingController(),
        wireCodeResponseController: TextEditingController(),
        descriptionResponseController: TextEditingController(),
        onDeviceChanged: (value) {},
        onWireTypeChanged: (value) {},
        onItemTypeChanged: (value) {},
      );
    },
  );
}
