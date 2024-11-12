import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String labeltext;
  final bool enabled;

  const PasswordTextField({
    required this.keyboardType,
    required this.controller,
    required this.labeltext,
    required this.enabled,
    super.key,
  });

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextSelectionTheme(
        data: const TextSelectionThemeData(
          selectionColor: Color(0x33000000),
          selectionHandleColor: Color(0xFF808080),
        ),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF333333)),
          ),
          child: TextField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            cursorColor: const Color(0xFFFFFFFF),
            style: const TextStyle(color: Color(0xFFFFFFFF)),
            decoration: InputDecoration(
              labelText: widget.labeltext,
              labelStyle: const TextStyle(
                color: Color(0xFF808080),
              ),
              filled: false,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0066FF)),
                borderRadius: BorderRadius.zero,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 7.5),
              suffixIcon: IconButton(
                icon: Image.asset(
                  isPasswordVisible
                      ? 'assets/Icons/visibility.png'
                      : 'assets/Icons/visibility_off.png',
                  width: 24,
                  height: 24,
                  color: const Color(0xFF808080),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !isPasswordVisible,
            enabled: widget.enabled,
          ),
        ),
      ),
    );
  }
}
