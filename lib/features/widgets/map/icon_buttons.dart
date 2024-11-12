import 'package:flutter/material.dart';

Widget buildMapButtons({
  required image,
  required VoidCallback onPressed,
}) {
  return Container(
    width: 35,
    height: 35,
    color: const Color(0xFFFFFFFF),
    child: IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        image,
        color: Color(0xFF1A1A1A),
      ),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}

Widget smallIconButton({
  required VoidCallback onPressed,
  required image,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF333333)
            : const Color(0xFFCCCCCC),
      ),
    ),
    constraints: BoxConstraints.tightFor(width: 30, height: 30),
    child: IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        image,
        height: 20,
        width: 20,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFFCCCCCC)
            : const Color(0xFF1A1A1A),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}

Widget bigIconButton({
  required VoidCallback onPressed,
  required image,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF333333)
            : const Color(0xFFCCCCCC),
      ),
    ),
    constraints: BoxConstraints.tightFor(width: 35, height: 35),
    child: IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        image,
        height: 22.5,
        width: 22.5,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFFCCCCCC)
            : const Color(0xFF1A1A1A),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}

Widget bigCloseButton({
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        // color:  const Color(0xFFEC1C24),
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF333333)
            : const Color(0xFFCCCCCC),
      ),
    ),
    constraints: BoxConstraints.tightFor(width: 35, height: 35),
    child: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Image.asset(
        'assets/Icons/map/close.png',
        height: 22.5,
        width: 22.5,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}
