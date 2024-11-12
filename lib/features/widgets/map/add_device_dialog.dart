import 'package:Octanet/features/map/controller/master_controller.dart';
import 'package:Octanet/features/widgets/custom_dropdown.dart';
import 'package:Octanet/features/widgets/map/add_ethernet.dart';
import 'package:Octanet/features/widgets/map/add_fbt_splitter.dart';
import 'package:Octanet/features/widgets/map/add_fiber_cable.dart';
import 'package:Octanet/features/widgets/map/add_patch_cord.dart';
import 'package:Octanet/features/widgets/map/add_plc_splitter.dart';
import 'package:Octanet/features/widgets/map/boxcore.dart';
import 'package:Octanet/features/widgets/map/icon_buttons.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddDeviceDialog extends StatefulWidget {
  final TextEditingController locNameController;
  final TextEditingController latController;
  final TextEditingController longController;
  final TextEditingController locNameResponseController;
  final TextEditingController wireTypeResponseController;
  final TextEditingController loopResponseController;
  final TextEditingController wireModeResponseController;
  final TextEditingController wireCodeResponseController;
  final TextEditingController descriptionResponseController;
  String? deviceValue;
  String? wireTypeValue;
  String? itemTypeValue;
  final Function(String?) onDeviceChanged;
  final Function(String?) onWireTypeChanged;
  final Function(String?) onItemTypeChanged;

  AddDeviceDialog({
    super.key,
    required this.locNameController,
    required this.latController,
    required this.longController,
    required this.locNameResponseController,
    required this.wireTypeResponseController,
    required this.loopResponseController,
    required this.wireModeResponseController,
    required this.wireCodeResponseController,
    required this.descriptionResponseController,
    this.deviceValue,
    this.wireTypeValue,
    this.itemTypeValue,
    required this.onDeviceChanged,
    required this.onWireTypeChanged,
    required this.onItemTypeChanged,
  });

  @override
  State<AddDeviceDialog> createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final masterItemController = Get.put(MasterItemController());

  bool itemTypeVisible = false;
  String? selectedItemTypeValue;
  String? selectedItemType;

  // void submitDevice() {
  //   if (widget.deviceValue == null ||
  //       widget.locNameController.text.isEmpty ||
  //       widget.latController.text.isEmpty ||
  //       widget.longController.text.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       'Please fill out all required fields.',
  //       backgroundColor: const Color(0xFFEC1C24),
  //       colorText: Colors.white,
  //       borderRadius: 0,
  //       margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
  //     );
  //     return;
  //   }

  //   final userDeviceController = Get.find<UserDeviceController>();
  //   final Map<String, dynamic> requestData = {
  //     'location_name': widget.locNameController.text,
  //     'item': int.tryParse(widget.deviceValue!),
  //     'latitude': widget.latController.text,
  //     'longitude': widget.longController.text,
  //   };

  //   userDeviceController
  //       .submitUserDeviceData(UserDeviceRequest.fromJson(requestData))
  //       .then((response) {
  //     if (response) {
  //       widget.locNameController.clear();
  //       widget.deviceValue = null;
  //       widget.latController.clear();
  //       widget.longController.clear();
  //       Get.snackbar(
  //         'Success',
  //         'Your Device has been saved.',
  //         backgroundColor: const Color(0xFF009345),
  //         colorText: Colors.white,
  //         borderRadius: 0,
  //         margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
  //       );
  //       userDeviceController.userDeviceData();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF333333)
                            : const Color(0xFFCCCCCC),
                      )),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 7.5),
                    child: Row(
                      children: [
                        const Text('Add Device',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0066FF))),
                        const Spacer(),
                        smallIconButton(
                            onPressed: () {},
                            image: 'assets/Icons/map/save.png',
                            context: context),
                        const SizedBox(width: 3),
                        smallIconButton(
                            onPressed: () {
                              showBoxCoreDialog(context);
                            },
                            image: 'assets/Icons/map/view.png',
                            context: context),
                        const SizedBox(width: 3),
                        smallIconButton(
                            onPressed: () {
                              setState(() {
                                itemTypeVisible = !itemTypeVisible;
                              });
                            },
                            image: 'assets/Icons/map/add.png',
                            context: context),
                        const SizedBox(width: 15),
                        bigCloseButton(context: context),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1A1A1A)
                            : const Color(0xFFFFFFFF),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                buildTextField(
                                  labeltext: 'Location Name',
                                  controller: widget.locNameController,
                                  keyboardType: TextInputType.name,
                                  enabled: true,
                                  context: context,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Obx(() => buildDropdown(
                                      value: widget.deviceValue,
                                      items: masterItemController.masterItemData
                                          .map((masterItem) {
                                        return DropdownMenuItem<String>(
                                          value: '${masterItem.id}',
                                          child: Text('${masterItem.name}'),
                                        );
                                      }).toList(),
                                      onChanged: widget.onDeviceChanged,
                                      label: 'Device',
                                      context: context,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                buildTextField(
                                  labeltext: 'Latitude',
                                  controller: widget.latController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  context: context,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                buildTextField(
                                  labeltext: 'Longitude',
                                  controller: widget.longController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  context: context,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (itemTypeVisible)
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Row(
                            children: [
                              buildDropdown(
                                value: widget.itemTypeValue,
                                items: [
                                  DropdownMenuItem<String>(
                                    value: '1',
                                    child: Text('Patch cords'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '2',
                                    child: Text('Fiber Cable'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '3',
                                    child: Text('PLC Splitter'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '4',
                                    child: Text('FBT Splitter'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: '5',
                                    child: Text('Ethernet'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedItemType = value;
                                    widget.onItemTypeChanged(value);
                                    itemTypeVisible = false;
                                    widget.itemTypeValue = null;
                                  });
                                },
                                label: 'Item Type',
                                context: context,
                              ),
                            ],
                          ),
                        ),
                      if (selectedItemType == '1')
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: PatchCord(
                            locNameController: widget.locNameResponseController,
                            loopController: widget.loopResponseController,
                            descriptionController:
                                widget.descriptionResponseController,
                            wireTypeValue: widget.wireTypeValue,
                            onWireTypeChanged: widget.onWireTypeChanged,
                          ),
                        ),
                      if (selectedItemType == '2')
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: FiberCable(
                            locNameController: widget.locNameResponseController,
                            loopController: widget.loopResponseController,
                            wireCodeController:
                                widget.wireCodeResponseController,
                            descriptionController:
                                widget.descriptionResponseController,
                            wireTypeValue: widget.wireTypeValue,
                            onWireTypeChanged: widget.onWireTypeChanged,
                          ),
                        ),
                      if (selectedItemType == '3')
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: PLCSplitter(
                            descriptionController:
                                widget.descriptionResponseController,
                            wireTypeValue: widget.wireTypeValue,
                            onWireTypeChanged: widget.onWireTypeChanged,
                          ),
                        ),
                      if (selectedItemType == '4')
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: FBTSplitter(
                            descriptionController:
                                widget.descriptionResponseController,
                            wireTypeValue: widget.wireTypeValue,
                            onWireTypeChanged: widget.onWireTypeChanged,
                          ),
                        ),
                      if (selectedItemType == '5')
                        Container(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFFFFFFF),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Ethernet(
                            locNameController: widget.locNameResponseController,
                            loopController: widget.loopResponseController,
                            descriptionController:
                                widget.descriptionResponseController,
                            wireTypeValue: widget.wireTypeValue,
                            onWireTypeChanged: widget.onWireTypeChanged,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
