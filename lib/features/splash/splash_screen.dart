import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/splash/controller/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    splashController.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/splashscreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image.asset(
          'assets/Icons/octanet_logo_text_w.png',
          width: 225,
        )),
      ),
    );
  }
}
