import 'package:flutter/material.dart';
import 'package:sail_test/presentation/login_screen/login_screen.dart';
import 'package:sail_test/presentation/qr_code_screen/qr_code_screen.dart';
import 'package:sail_test/presentation/landing_page_screen/landing_page_screen.dart';
import 'package:sail_test/presentation/mills_screen/mills_screen.dart';
import 'package:sail_test/presentation/call_sms_screen/call_sms_screen.dart';
import 'package:sail_test/presentation/report_screen/report_screen.dart';
import 'package:sail_test/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sail_test/splash_screen.dart';
import 'package:sail_test/presentation/mills_screen/fetch_data.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String millsScreen = '/mills_screen';

  static const String loginScreen = '/login_screen';

  static const String qrCodeScreen = '/qr_code_screen';

  static const String fetchDataScreen = '/fetch_data';

  static const String landingPageScreen = '/landing_page_screen';

  static const String callSmsScreen = '/call_sms_screen';

  static const String reportScreen = '/report_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    millsScreen: (context) => MillScreen(),
    fetchDataScreen: (context) => TableDataPage(),
    qrCodeScreen: (context) => QrCodeScreen(),
    landingPageScreen: (context) => LandingPageScreen(),
    callSmsScreen: (context) => CallSmsScreen(),
    reportScreen: (context) => ReportScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}