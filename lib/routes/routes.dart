import 'package:Octanet/S.dart';
import 'package:Octanet/features/dashboard/dashboard.dart';
import 'package:Octanet/features/profile/profile.dart';
import 'package:Octanet/features/forget_password/forget_password.dart';
import 'package:Octanet/features/login/login.dart';
import 'package:Octanet/features/splash/splash_screen.dart';
import 'package:Octanet/features/map/map.dart';
import 'package:Octanet/features/mikrotik/mikrotik.dart';
import 'package:Octanet/features/olt/olt.dart';
import 'package:Octanet/features/reports/reports.dart';
import 'package:Octanet/features/query/query.dart';
import 'package:Octanet/features/login/binding/login_binding.dart';
import 'package:Octanet/features/splash/binding/splash_binding.dart';
import 'package:Octanet/features/forget_password/binding/forgot_password_binding.dart';
import 'package:Octanet/features/dashboard/binding/dashboard_binding.dart';
import 'package:Octanet/features/profile/binding/profile_binding.dart';
import 'package:Octanet/features/map/binding/map_binding.dart';
import 'package:Octanet/features/mikrotik/binding/mikrotik_binding.dart';
import 'package:Octanet/features/olt/binding/olt_binding.dart';
import 'package:Octanet/features/reports/binding/reports_binding.dart';
import 'package:Octanet/features/query/binding/query_binding.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const String splashRoute = "/Splash";
  static const String initialRoute = '/initialRoute';
  static const String forget_passwordRoute = "/ForgetPassword";
  static const String loginRoute = "/Login";
  static const String profileRoute = "/Profile";
  static const String dashboardRoute = "/Dashboard";
  static const String mapRoute = "/Map";
  static const String mikrotikRoute = "/Mikrotik";
  static const String oltRoute = "/OLT";
  static const String reportsRoute = "/Reports";
  static const String queryRoute = "/Query";
  static const String sRoute = "/S";

  static List<GetPage> pages = [
    GetPage(
      name: queryRoute,
      page: () => const Query(),
      bindings: [
        QueryBinding(),
      ],
    ),
    GetPage(
      name: reportsRoute,
      page: () => const Reports(),
      bindings: [
        ReportsBinding(),
      ],
    ),
    GetPage(
      name: oltRoute,
      page: () => const OLT(),
      bindings: [
        OLTBinding(),
      ],
    ),
    GetPage(
      name: mikrotikRoute,
      page: () => const Mikrotik(),
      bindings: [
        MikrotikBinding(),
      ],
    ),
    GetPage(
      name: mapRoute,
      page: () => const Map(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: profileRoute,
      page: () => const Profile(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: dashboardRoute,
      page: () => const Dashboard(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: forget_passwordRoute,
      page: () => ForgetPassword(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: loginRoute,
      page: () => Login(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: splashRoute,
      page: () => const Splash(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const Splash(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: sRoute,
      page: () => const S(),
      bindings: [
        ProfileBinding(),
      ],
    ),
  ];
}
