import 'package:flutter/material.dart';

// Drawer Button Widget
Widget buildDrawerButton({
  required String image,
  required String label,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Color(0x00000000)),
      foregroundColor: WidgetStateProperty.all<Color>(Color(0xFFFFFFFF)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
    ),
    child: Row(
      children: [
        Image.asset(
          image,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 15),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

// Active Drawer Button Widget
Widget buildDrawerActiveButton({
  required String image,
  required String label,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Color(0x5F000000)),
      foregroundColor: WidgetStateProperty.all<Color>(Color(0xFFFFFFFF)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      minimumSize: WidgetStateProperty.all<Size>(const Size(60, 40)),
      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
    ),
    child: Row(
      children: [
        Image.asset(
          image,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 15),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
