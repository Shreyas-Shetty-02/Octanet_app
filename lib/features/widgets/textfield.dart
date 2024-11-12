import 'package:flutter/material.dart';

Widget buildTextField({
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String labeltext,
  required bool enabled,
  required BuildContext context,
}) {
  return Expanded(
    child: TextSelectionTheme(
      data: const TextSelectionThemeData(
        selectionColor: Color(0x33000000),
        selectionHandleColor: Color(0xFF333333),
      ),
      child: SizedBox(
        height: 50,
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: const Color(0xFFFFFFFF),
          cursorWidth: 1,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFFCCCCCC)
                : const Color(0xFF1A1A1A),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFCCCCCC)
                  : const Color(0xFF1A1A1A),
              fontSize: 14,
            ),
            filled: false,
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
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
          ),
          obscureText: false,
          enabled: enabled,
        ),
      ),
    ),
  );
}

Widget buildSearchField({
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String labeltext,
  required bool enabled,
  required BuildContext context,
}) {
  return Expanded(
    child: TextSelectionTheme(
      data: const TextSelectionThemeData(
        selectionColor: Color(0x33000000),
        selectionHandleColor: Color(0xFF333333),
      ),
      child: SizedBox(
        height: 50,
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: const Color(0xFFFFFFFF),
          cursorWidth: 1,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFFCCCCCC)
                : const Color(0xFF1A1A1A),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFCCCCCC)
                  : const Color(0xFF1A1A1A),
              fontSize: 14,
            ),
            filled: false,
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
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            suffixIcon: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/Icons/map/search.png',
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFFCCCCCC)
                    : const Color(0xFF1A1A1A),
              ),
            ),
            suffixIconConstraints:
                BoxConstraints.tightFor(width: 30, height: 30),
          ),
          obscureText: false,
          enabled: enabled,
        ),
      ),
    ),
  );
}
