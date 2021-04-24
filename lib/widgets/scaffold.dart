import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/utils/status_bar_color_changer.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final double width;
  final Widget appbar;

  const CustomScaffold({
    Key key,
    @required this.child,
    @required this.width,
    this.appbar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBarColorChanger(
      androidIconBrightness: Brightness.dark,
      iosStatusBarBrightness: Brightness.dark,
      androidStatusBarColor: MetaAsset.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MetaAsset.black,
          appBar: appbar,
          body: SizedBox(
            child: child,
            width: width,
          ),
        ),
      ),
    );
  }
}
