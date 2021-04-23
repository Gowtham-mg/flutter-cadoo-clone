import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MetaAsset.black,
        body: SizedBox(
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                MetaText.cadoo,
                style: MetaStyles.onboardingAppNameStyle,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        MetaText.createAnAccount,
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) onSaved;

  const LoginTextFormField(
      {Key key, @required this.hintText, @required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          gapPadding: 10,
          borderSide: BorderSide(color: MetaAsset.white),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      onSaved: onSaved,
      cursorColor: MetaAsset.white,
    );
  }
}
