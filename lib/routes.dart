import 'dart:io';

import 'package:cadoo/screens/auth.dart';
import 'package:cadoo/screens/balance/balance_history.dart';
import 'package:cadoo/screens/balance/withdraw.dart';
import 'package:cadoo/screens/contact_support.dart';
import 'package:cadoo/screens/balance/funds_screen.dart';
import 'package:cadoo/screens/home.dart';
import 'package:cadoo/screens/onboarding.dart';
import 'package:cadoo/screens/profile/edit_profile.dart';
import 'package:cadoo/screens/profile/following.dart';
import 'package:cadoo/screens/profile/profile.dart';
import 'package:cadoo/screens/referrals.dart';
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
  static const String myBalance = "/balance";
  static const String referrals = "/referrals";
  static const String contactSupport = "/contact_support";
  static const String withdraw = "/withdraw";
  static const String balanceHistory = "/balance/history";
  static const String profile = "/profile";
  static const String editProfile = "/profile/edit";
  static const String followers = "/profile/followers";
  static const String following = "/profile/following";

  static final bool isIOS = Platform.isIOS;

  static Route<dynamic> generateRoute(RouteSettings settings) {
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
      case Routes.myBalance:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => MyBalanceScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => MyBalanceScreen());
      case Routes.referrals:
        return isIOS
            ? CupertinoPageRoute(builder: (BuildContext context) => Referrals())
            : MaterialPageRoute(builder: (BuildContext context) => Referrals());
      case Routes.editProfile:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => EditProfile())
            : MaterialPageRoute(
                builder: (BuildContext context) => EditProfile());
      case Routes.followers:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => FollowingScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => FollowingScreen());
      case Routes.following:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => FollowingScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => FollowingScreen());

      case Routes.profile:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => ProfileScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => ProfileScreen());
      case Routes.balanceHistory:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => BalanceHistory())
            : MaterialPageRoute(
                builder: (BuildContext context) => BalanceHistory());
      case Routes.withdraw:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => WithdrawScreen())
            : MaterialPageRoute(
                builder: (BuildContext context) => WithdrawScreen());
      case Routes.contactSupport:
        return isIOS
            ? CupertinoPageRoute(
                builder: (BuildContext context) => ContactSupport())
            : MaterialPageRoute(
                builder: (BuildContext context) => ContactSupport());

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
