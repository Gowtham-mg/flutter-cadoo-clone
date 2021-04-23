import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    Key key,
    @required this.width,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: MetaAsset.black,
          fontSize: 17,
          fontWeight: FontWeight.w800,
          fontFamily: MetaAsset.roboto,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      minWidth: width * 0.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      color: MetaAsset.white,
      onPressed: onPressed,
    );
  }
}
