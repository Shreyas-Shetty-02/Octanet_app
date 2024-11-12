import 'package:flutter/material.dart';

Widget buildDropdown<T>({
  required T? value,
  required List<DropdownMenuItem<T>> items,
  required ValueChanged<T?>? onChanged,
  required String label,
  required BuildContext context,
}) {
  return Expanded(
    child: SizedBox(
      height: 50,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<T>(
          value: value,
          dropdownColor: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF000000)
              : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.zero,
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Icons/dropdown_icon.png',
                height: 12,
                width: 12,
                color: const Color(0xFFCCCCCC),
              ),
            ],
          ),
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF000000),
              fontSize: 14),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF000000),
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF333333)
                    : const Color(0xFFCCCCCC),
              ),
              borderRadius: BorderRadius.zero,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF333333)
                    : const Color(0xFFCCCCCC),
              ),
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0066FF)),
              borderRadius: BorderRadius.zero,
            ),
          ),
          onChanged: onChanged,
          items: items,
        ),
      ),
    ),
  );
}
