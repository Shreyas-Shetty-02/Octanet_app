import 'package:Octanet/features/widgets/custom_dropdown.dart';
import 'package:Octanet/features/widgets/map/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/widgets/textfield.dart';
import 'package:Octanet/features/map/controller/master_wire_controller.dart';

class Ethernet extends StatelessWidget {
  final TextEditingController locNameController;
  final TextEditingController loopController;
  final TextEditingController descriptionController;
  final String? wireTypeValue;
  final Function(String?) onWireTypeChanged;

  Ethernet({
    super.key,
    required this.locNameController,
    required this.loopController,
    required this.descriptionController,
    required this.wireTypeValue,
    required this.onWireTypeChanged,
  });

  final masterWireController = Get.put(MasterWireController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF333333)
                : const Color(0xFFCCCCCC),
          ),
          borderRadius: BorderRadius.zero),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/Images/ethernet.png',
                height: 45,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              smallIconButton(
                  onPressed: () {},
                  image: 'assets/Icons/map/delete.png',
                  context: context),
              const SizedBox(width: 3),
              smallIconButton(
                  onPressed: () {},
                  image: 'assets/Icons/map/location.png',
                  context: context),
              const SizedBox(width: 3),
              smallIconButton(
                  onPressed: () {},
                  image: 'assets/Icons/map/box_core.png',
                  context: context),
            ],
          ),
          const SizedBox(height: 7.5),
          Row(
            children: [
              buildTextField(
                labeltext: 'Location Name',
                controller: locNameController,
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
                value: wireTypeValue,
                items:
                    masterWireController.getEthernetWires().map((ethernetWire) {
                  return DropdownMenuItem<String>(
                    value: '${ethernetWire.id}',
                    child: Text('${ethernetWire.name}'),
                  );
                }).toList(),
                onChanged: onWireTypeChanged,
                label: 'Wire Type',
                context: context,
              ),
            ],
          ),
          const SizedBox(height: 7.5),
          Row(
            children: [
              buildTextField(
                labeltext: 'Loop',
                controller: loopController,
                keyboardType: TextInputType.number,
                enabled: true,
                context: context,
              ),
            ],
          ),
          const SizedBox(height: 7.5),
          Row(
            children: [
              buildTextField(
                labeltext: 'Description',
                controller: descriptionController,
                keyboardType: TextInputType.text,
                enabled: true,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
