import 'package:Octanet/features/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:Octanet/core/errors/exceptions.dart';
import 'package:Octanet/features/login/controller/login_controller.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
            key: loginController.formKey,
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
                                    controller: passController,
                                    name: 'password',
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: const Color(0xBE000000),
                                    style: const TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
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
                                      suffixIcon: IconButton(
                                        icon: Image.asset(
                                          isPasswordVisible
                                              ? 'assets/Icons/visibility.png'
                                              : 'assets/Icons/visibility_off.png',
                                          width: 24,
                                          height: 24,
                                          color: const Color(0xFF808080),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isPasswordVisible =
                                                !isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: !isPasswordVisible,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 25,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Get.offAllNamed(
                                        MyRoutes.forget_passwordRoute);
                                  },
                                  style: ButtonStyle(
                                    overlayColor:
                                        WidgetStateProperty.all<Color>(
                                            Colors.transparent),
                                    padding: WidgetStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              buildButtons(
                                label: 'Login',
                                onPressed: () {
                                  if (loginController.formKey.currentState!
                                      .saveAndValidate()) {
                                    loginController.loginRequest.email =
                                        loginController.formKey.currentState!
                                            .value['email'];
                                    loginController.loginRequest.password =
                                        loginController.formKey.currentState!
                                            .value['password'];
                                    login();
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFFCCCCCC)),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      const url =
                                          'https://staging.octanet.tech/register-user';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    style: ButtonStyle(
                                      overlayColor:
                                          WidgetStateProperty.all<Color>(
                                              Colors.transparent),
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 5),
                                      ),
                                    ),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF0066FF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
    );
  }

  Future<void> login() async {
    try {
      await loginController.login();
      Get.offAllNamed(MyRoutes.dashboardRoute);
    } on BaseException catch (e) {
      if (mailController.text.isEmpty || passController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Please enter credentials',
          backgroundColor: const Color(0xFFEC1C24),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: const Color(0xFFEC1C24),
          colorText: Colors.white,
          borderRadius: 0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        );
      }
    }
  }
}
