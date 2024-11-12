import 'package:flutter/material.dart';

void showStoragePermissionDeniedDialog(BuildContext context) {
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
          "Permission Denied",
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
          ),
        ),
        content: Text(
          "Storage access is required to pick files. Please enable the permission in settings.",
          textAlign: TextAlign.justify,
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

void showLocationPermissionDeniedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1A1A1A)
            : const Color(0xFFFFFFFF),
        title: Text(
          'Location Services Disabled',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
          ),
        ),
        content: Text(
          'Please enable location services to use this feature.',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color,
              ),
            ),
          ),
        ],
      );
    },
  );
}
