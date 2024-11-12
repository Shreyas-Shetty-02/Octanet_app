import 'package:Octanet/features/map/models/user_device_model.dart' as model;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> addBumbooEncloserMarkers(Set<Marker> markers,
    List<model.UserDevice> userDeviceData, Function setState) async {
  final bumbooEncloserIcon = await BitmapDescriptor.asset(
    ImageConfiguration(size: Size(25, 25)),
    'assets/Images/bumboo_encloser.png',
  );

  final bumbooDevices = userDeviceData
      .where((device) =>
          device.itemName == 'Bumboo Encloser-24F' ||
          device.itemName == 'Bumboo Encloser-48F' ||
          device.itemName == 'Bumboo Encloser-96F')
      .toList();

  setState(() {
    for (var device in bumbooDevices) {
      if (device.latitude != null && device.longitude != null) {
        double? lat = double.tryParse(device.latitude!);
        double? lng = double.tryParse(device.longitude!);
        markers.add(
          Marker(
            markerId: MarkerId(device.itemName! + device.latitude.toString()),
            position: LatLng(lat!, lng!),
            icon: bumbooEncloserIcon,
          ),
        );
      }
    }
  });
}
