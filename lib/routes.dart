import 'dart:io';

import 'package:cadoo/screens/auth.dart';
import 'package:cadoo/screens/home.dart';
import 'package:cadoo/screens/onboarding.dart';
import 'package:cadoo/screens/voucher_details.dart';
import 'package:cadoo/screens/write_reply.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onboarding = "/onboarding";
  static const String authScreen = "/auth";
  static const String home = "/home";
  static const String voucherDetails = "/voucher_details";
  static const String writeReply = "/write_reply";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final bool isIOS = Platform.isIOS;
    switch (settings.name) {
      case Routes.onboarding:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => OnboardingScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen());
      case Routes.authScreen:
        final bool isSignup = settings.arguments as bool;
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) =>
                    AuthScreen(isSignup: isSignup))
            : MaterialPageRoute(
                builder: (BuildContext context) =>
                    AuthScreen(isSignup: isSignup));
      case Routes.home:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => HomeScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen());
      case Routes.voucherDetails:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => VoucherDetails())
            : MaterialPageRoute(
                builder: (BuildContext context) => VoucherDetails());
      case Routes.writeReply:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => WriteReply())
            : MaterialPageRoute(
                builder: (BuildContext context) => WriteReply());
      default:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => OnboardingScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen());
    }
  }
}
