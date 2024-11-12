import 'package:Octanet/features/map/models/user_device_model.dart' as model;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/map/controller/user_device_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InactiveONUWidget extends StatefulWidget {
  final GoogleMapController? mapController;

  const InactiveONUWidget({super.key, this.mapController});

  @override
  State<InactiveONUWidget> createState() => InactiveONUWidgetState();
}

class InactiveONUWidgetState extends State<InactiveONUWidget> {
  final UserDeviceController controller = Get.find<UserDeviceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return buildMapButton(
        image: 'assets/Icons/map/inactive_onu.png',
        notificationCount: controller.inactiveONUs.length,
        onPressed: () => showInactiveONUWidgetDialog(
            context,
            controller.inactiveONUs,
            controller.inactiveONUs.map((device) {
              return () {
                if (device.latitude != null && device.longitude != null) {
                  double? lat = double.tryParse(device.latitude!);
                  double? lng = double.tryParse(device.longitude!);
                  if (lat != null && lng != null) {
                    widget.mapController?.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(lat, lng),
                          zoom: 20,
                        ),
                      ),
                    );
                  }
                }
              };
            }).toList()),
      );
    });
  }

  Widget buildMapButton({
    required String image,
    required VoidCallback onPressed,
    int? notificationCount,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 35,
          height: 35,
          color: const Color(0xFFFFFFFF),
          child: IconButton(
            onPressed: onPressed,
            icon: Transform.scale(
              scale: 1.25,
              child: Image.asset(
                image,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        if (notificationCount != null && notificationCount > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void showInactiveONUWidgetDialog(BuildContext context,
      List<model.UserDevice> inActiveOnus, List<VoidCallback> onPressedList) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 7.5),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFF333333))),
              ),
              child: const Text(
                'Inactive ONUs',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFEC1C24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFFCCCCCC),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Column(
                children: List.generate(inActiveOnus.length, (index) {
                  return Column(
                    children: [
                      buildDialogListItem(
                          inActiveOnus[index], onPressedList[index]),
                      const SizedBox(height: 5),
                    ],
                  );
                }),
              ),
            )
          ]),
        );
      },
    );
  }

  Widget buildDialogListItem(
      model.UserDevice inActiveOnu, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1A1A1A)
              : const Color(0xFFCCCCCC),
          border: Border.all(color: const Color(0xFF333333)),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/Icons/map/inactive.png',
              height: 20,
            ),
            const SizedBox(width: 5),
            Text(
              '${inActiveOnu.locationName}',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFFE6E6E6)
                    : const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
