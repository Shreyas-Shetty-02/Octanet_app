import 'package:Octanet/utlis/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/initial_bindings.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:Octanet/utlis/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return Obx(() {
      return GetMaterialApp(
        initialBinding: InitialBindings(),
        initialRoute: MyRoutes.initialRoute,
        getPages: MyRoutes.pages,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.theme,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
