import 'package:flutter/material.dart';

Widget buildButtons({
  required String label,
  required VoidCallback? onPressed,
}) {
  return Expanded(
    child: Container(
      constraints: BoxConstraints.tightFor(height: 35),
      color: const Color(0xFFCCCCCC),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Color(0xFF000000)),
        ),
      ),
    ),
  );
}
