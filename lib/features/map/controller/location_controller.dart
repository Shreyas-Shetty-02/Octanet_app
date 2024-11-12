import 'dart:math';
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/map/models/location_model.dart' as model;
import 'package:Octanet/features/map/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  RxList<model.Location> locationData = <model.Location>[].obs;
  RxBool isLoading = false.obs;
  RxSet<Polygon> polygons = <Polygon>{}.obs;
  GoogleMapController? mapController;

  @override
  void onReady() {
    super.onReady();
    fetchLocationData();
  }

  Future<void> fetchLocationData() async {
    isLoading.value = true;
    try {
      List<model.Location> data = await LocationService().getLocationData();
      locationData.assignAll(data);
      polygons.clear();
      LatLngBounds? bounds;
      for (var location in data) {
        if (location.polygon != null && location.polygon!.isNotEmpty) {
          List<LatLng> polygonPoints = location.polygon!
              .map((point) => LatLng(point.lat!, point.lng!))
              .toList();
          polygons.add(
            Polygon(
              polygonId: PolygonId('polygon_${location.id}'),
              points: polygonPoints,
              strokeColor: Colors.blue,
              strokeWidth: 2,
              fillColor: Colors.transparent,
            ),
          );
          bounds = _updateBounds(bounds, polygonPoints);
        }
      }
      if (bounds != null && mapController != null) {
        mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      }
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  LatLngBounds _updateBounds(LatLngBounds? bounds, List<LatLng> points) {
    double? minLat, maxLat, minLng, maxLng;
    for (var point in points) {
      if (minLat == null || point.latitude < minLat) minLat = point.latitude;
      if (maxLat == null || point.latitude > maxLat) maxLat = point.latitude;
      if (minLng == null || point.longitude < minLng) minLng = point.longitude;
      if (maxLng == null || point.longitude > maxLng) maxLng = point.longitude;
    }
    if (minLat != null && maxLat != null && minLng != null && maxLng != null) {
      if (bounds == null) {
        return LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        );
      } else {
        return LatLngBounds(
          southwest: LatLng(
            min(minLat, bounds.southwest.latitude),
            min(minLng, bounds.southwest.longitude),
          ),
          northeast: LatLng(
            max(maxLat, bounds.northeast.latitude),
            max(maxLng, bounds.northeast.longitude),
          ),
        );
      }
    }
    return bounds!;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
