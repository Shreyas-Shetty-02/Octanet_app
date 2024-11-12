import 'package:Octanet/features/map/controller/user_device_controller.dart';
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
class ViewDeviceDialog extends StatefulWidget {
  String itemIcon;
  TextEditingController locNameController;
  TextEditingController locNameResponseController;
  TextEditingController wireTypeResponseController;
  TextEditingController loopResponseController;
  TextEditingController wireModeResponseController;
  TextEditingController wireCodeResponseController;
  TextEditingController descriptionResponseController;
  String? deviceValue;
  String? wireTypeValue;
  String? itemTypeValue;
  Function(String?) onDeviceChanged;
  Function(String?) onWireTypeChanged;
  Function(String?) onItemTypeChanged;

  ViewDeviceDialog({
    super.key,
    required this.itemIcon,
    required this.locNameController,
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
  State<ViewDeviceDialog> createState() => _ViewDeviceDialogState();
}

class _ViewDeviceDialogState extends State<ViewDeviceDialog> {
  UserDeviceController userDeviceController = Get.put(UserDeviceController());

  bool itemTypeVisible = false;
  String? selectedItemTypeValue;
  String? selectedItemType;

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
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.itemIcon,
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 3),
                        bigIconButton(
                            onPressed: () {},
                            image: 'assets/Icons/map/image_upload.png',
                            context: context),
                        const SizedBox(width: 3),
                        bigIconButton(
                            onPressed: () {},
                            image: 'assets/Icons/map/image_upload.png',
                            context: context),
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
                            onPressed: () {},
                            image: 'assets/Icons/map/description.png',
                            context: context),
                        const SizedBox(width: 3),
                        smallIconButton(
                            onPressed: () {},
                            image: 'assets/Icons/map/add.png',
                            context: context),
                        const SizedBox(width: 3),
                        bigCloseButton(context: context),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
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
                        const SizedBox(height: 7.5),
                        Row(
                          children: [
                            buildDropdown(
                              value: widget.deviceValue,
                              items: userDeviceController.userDeviceData
                                  .map((userDevice) {
                                return DropdownMenuItem<String>(
                                  value: '${userDevice.item}',
                                  child: Text('${userDevice.itemName}'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                widget.onDeviceChanged(value);
                              },
                              label: 'Device',
                              context: context,
                            ),
                          ],
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                        //   margin: EdgeInsets.only(top: 10),
                        //   decoration: BoxDecoration(
                        //     color: const Color(0xFFFFFFFF),
                        //     borderRadius: BorderRadius.circular(8),
                        //     border: Border.all(color: const Color(0xBE000000)),
                        //   ),
                        //   child: DropdownButtonFormField<String>(
                        //     value: widget.itemTypeValue,
                        //     dropdownColor: const Color(0xFFFFFFFF),
                        //     borderRadius: BorderRadius.circular(10),
                        //     icon: Container(),
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       labelText: 'Item Type',
                        //       labelStyle: const TextStyle(
                        //         color: Color(0x7E000000),
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         selectedItemType = value;
                        //         widget.onItemTypeChanged(value);
                        //         itemTypeVisible = false;
                        //         widget.itemTypeValue = null;
                        //       });
                        //     },
                        //     items: [
                        //       DropdownMenuItem<String>(
                        //         value: '1',
                        //         child: Text('Patch cords'),
                        //       ),
                        //       DropdownMenuItem<String>(
                        //         value: '2',
                        //         child: Text('Fiber Cable'),
                        //       ),
                        //       DropdownMenuItem<String>(
                        //         value: '3',
                        //         child: Text('PLC Splitter'),
                        //       ),
                        //       DropdownMenuItem<String>(
                        //         value: '4',
                        //         child: Text('FBT Splitter'),
                        //       ),
                        //       DropdownMenuItem<String>(
                        //         value: '5',
                        //         child: Text('Ethernet'),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // if (selectedItemType == '1')
                        PatchCord(
                          locNameController: widget.locNameResponseController,
                          loopController: widget.loopResponseController,
                          descriptionController:
                              widget.descriptionResponseController,
                          wireTypeValue: widget.wireTypeValue,
                          onWireTypeChanged: widget.onWireTypeChanged,
                        ),
                        //if (selectedItemType == '2')
                        FiberCable(
                          locNameController: widget.locNameResponseController,
                          loopController: widget.loopResponseController,
                          wireCodeController: widget.wireCodeResponseController,
                          descriptionController:
                              widget.descriptionResponseController,
                          wireTypeValue: widget.wireTypeValue,
                          onWireTypeChanged: widget.onWireTypeChanged,
                        ),
                        //if (selectedItemType == '3')
                        PLCSplitter(
                          descriptionController:
                              widget.descriptionResponseController,
                          wireTypeValue: widget.wireTypeValue,
                          onWireTypeChanged: widget.onWireTypeChanged,
                        ),
                        //if (selectedItemType == '4')
                        FBTSplitter(
                          descriptionController:
                              widget.descriptionResponseController,
                          wireTypeValue: widget.wireTypeValue,
                          onWireTypeChanged: widget.onWireTypeChanged,
                        ),
                        //if (selectedItemType == '5')
                        Ethernet(
                          locNameController: widget.locNameResponseController,
                          loopController: widget.loopResponseController,
                          descriptionController:
                              widget.descriptionResponseController,
                          wireTypeValue: widget.wireTypeValue,
                          onWireTypeChanged: widget.onWireTypeChanged,
                        ),
                      ],
                    ),
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
