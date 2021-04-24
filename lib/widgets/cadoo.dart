import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:flutter/material.dart';

class Cadoo extends StatelessWidget {
  const Cadoo({
    Key key,
    this.style,
  }) : super(key: key);
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      MetaText.cadoo,
      style: style ?? MetaStyles.onboardingAppNameStyle,
    );
  }
}
