import 'dart:async';

import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/splash/service/splash_service.dart';
import 'package:Octanet/routes/routes.dart';

class SplashController extends GetxController {
  SplashService splashService = SplashService();
  // ignore: prefer_typing_uninitialized_variables
  var profile;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      bool isLogin = Get.find<PrefUtils>().getIsLogin();
      Get.find<ApiClient>().getToken().then((token) => {
            if (isLogin && token != 'login')
              {Get.offNamedUntil(MyRoutes.dashboardRoute, (route) => false)}
            else
              {Get.offNamed(MyRoutes.loginRoute)}
          });
    }).onError((error, stackTrace) {
      handleError(error!, stackTrace);
    });
  }

  Future<void> handleError(Object error, StackTrace stackTrace) async {
    // Handle the error
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }
}
