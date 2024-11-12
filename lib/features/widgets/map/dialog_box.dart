import 'package:flutter/material.dart';

void showOutsidePolygonDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1A1A1A)
            : const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          'Invalid Location',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
          ),
        ),
        content: Text(
          'You are outside your location.',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
          ),
        ),
        actionsPadding: const EdgeInsets.all(5),
        actions: <Widget>[
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Theme.of(context).textTheme.displayMedium?.color,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
