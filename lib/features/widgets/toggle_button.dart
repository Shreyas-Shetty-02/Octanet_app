import 'package:Octanet/utlis/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => ToggleButtonState();
}

class ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    final WidgetStateProperty<Color?> thumbColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0xFFFFFFFF);
        }
        return Color(0xFF000000);
      },
    );

    final WidgetStateProperty<Icon?> thumbIcon =
        WidgetStateProperty.resolveWith<Icon?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Icon(
            Icons.light_mode,
            color: Color(0xFFFFDD15),
          );
        }
        return Icon(
          Icons.dark_mode,
          color: Color(0xFFCCCCCC),
        );
      },
    );

    return Container(
      constraints: BoxConstraints.tightFor(width: 50, height: 25),
      child: Obx(
        () => Switch(
          value: themeController.isLightMode.value,
          onChanged: (bool value) {
            themeController.toggleTheme();
          },
          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => Color(0xFF0066FF),
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => Color(0xFF0066FF),
          ),
          thumbColor: thumbColor,
          thumbIcon: thumbIcon,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
