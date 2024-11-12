// ignore_for_file: depend_on_referenced_packages
import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';
import 'package:Octanet/features/login/models/login_request.dart';
import 'package:Octanet/features/login/models/login_response.dart';
import 'package:Octanet/features/login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginController extends GetxController {
  TextEditingController emailaddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  LoginRequest loginRequest = LoginRequest();
  LoginService loginService = LoginService();
  LoginResponse loginResponse = LoginResponse();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailaddressController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      loginResponse = await loginService.login(loginRequest);
      _handleCreateLoginSuccess();
    } catch (e) {
      rethrow;
    }
  }

  void _handleCreateLoginSuccess() {
    Get.find<PrefUtils>().setUser(loginResponse);
    Get.find<PrefUtils>().setIsLogin(true);
  }
}
