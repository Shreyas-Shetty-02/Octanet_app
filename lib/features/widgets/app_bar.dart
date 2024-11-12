import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/features/widgets/toggle_button.dart';
import 'package:Octanet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildAppBar({
  required String title,
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    surfaceTintColor: Theme.of(context).appBarTheme.backgroundColor,
    title: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        ToggleButton(),
        const SizedBox(width: 7.5),
        GestureDetector(
          onTap: () {
            Get.offAllNamed(MyRoutes.profileRoute);
          },
          child: ClipOval(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF666666),
              padding: EdgeInsets.all(7.5),
              child: Image.asset(
                'assets/Icons/profile.png',
                width: 17.5,
                height: 17.5,
                fit: BoxFit.cover,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF000000)
                    : const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    ),
    leading: IconButton(
      icon: Container(
        margin: const EdgeInsets.only(left: 7),
        child: Image.asset(
          'assets/Icons/hamburger.png',
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
      ),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
    ),
    leadingWidth: 47,
  );
}
