import 'dart:io';

import 'package:cadoo/screens/auth.dart';
import 'package:cadoo/screens/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onboarding = "/onboarding";
  static const String authScreen = "/auth";

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
      default:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => OnboardingScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen());
    }
  }
}
