import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isLightMode = true.obs;

  ThemeMode get theme => isLightMode.value ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    isLightMode.value = !isLightMode.value;
  }
}
