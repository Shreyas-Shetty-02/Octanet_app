// ignore_for_file: unnecessary_overrides

import 'package:Octanet/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:Octanet/features/forget_password/models/forgot_request.dart';
import 'package:Octanet/features/forget_password/services/forgot_password_service.dart';
import 'package:Octanet/routes/routes.dart';

class ForgotPasswordController extends GetxController {
  String emailaddressController = "";

  Rx<bool> isShowPassword = true.obs;

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  ForgotPasswordService forgotPasswordService = ForgotPasswordService();
  ForgotRequest forgotRequest = ForgotRequest();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> send() async {
    try {
      var res = await forgotPasswordService.send(forgotRequest);
      // _handleCreateLoginSuccess(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  //void _handleCreateLoginSuccess(res) {
  //  Get.find<PrefUtils>().setUser(loginResponse);
  //  Get.find<PrefUtils>().setIsLogin(true);
  //}
  void gotoResetPage() {
    Get.toNamed(MyRoutes.loginRoute);
  }
}
