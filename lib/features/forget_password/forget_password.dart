// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, use_build_context_synchronously
import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/core/errors/exceptions.dart';
import 'package:Octanet/features/forget_password/controller/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class ForgetPassword extends GetWidget<ForgotPasswordController> {
  ForgetPassword({super.key});

  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(MyRoutes.loginRoute);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'assets/Images/splashscreen.jpg',
                fit: BoxFit.cover,
              ),
            ),
            FormBuilder(
              key: controller.formKey,
              child: Center(
                child: SizedBox(
                  width: 325,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF000000),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Icons/octanet_logo.png',
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFF333333))),
                                  child: TextSelectionTheme(
                                    data: const TextSelectionThemeData(
                                      selectionColor: Color(0x33000000),
                                      selectionHandleColor: Color(0xFF808080),
                                    ),
                                    child: FormBuilderTextField(
                                      controller: mailController,
                                      name: 'email',
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: const Color(0xBE000000),
                                      style: const TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontSize: 14,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: const TextStyle(
                                          color: Color(0xFFCCCCCC),
                                          fontSize: 14,
                                        ),
                                        filled: false,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFCCCCCC)),
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                buildButtons(
                                  label: 'Confirm',
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .saveAndValidate()) {
                                      controller.forgotRequest.email =
                                          controller.formKey.currentState!
                                              .value['email'];
                                      onTapSend(context);
                                    }
                                  },
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dialogBox(BuildContext context) async {
    var res = await controller.send();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "The link has been sent to your email.",
                    style: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
                  ),
                  const SizedBox(height: 20),
                  buildButtons(
                    label: 'OK',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    _onOnTapLoginSuccess(res);
  }

  Future<dynamic> onTapSend(BuildContext context) async {
    try {
      dialogBox(context);
    } on BaseException catch (e) {
      _onOnTapforgotError(e);
      // ignore: empty_catches
    } catch (e) {}
  }

  void _onOnTapLoginSuccess(res) {
    Fluttertoast.showToast(
      msg: res,
    );
    controller.gotoResetPage();
  }

  void _onOnTapforgotError(BaseException e) {
    Fluttertoast.showToast(
      msg: e.message,
    );
  }
}
