import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/utils/validation_helper.dart';
import 'package:cadoo/widgets/app_rounded_button.dart';
import 'package:cadoo/widgets/cadoo.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignup;

  const AuthScreen({Key key, @required this.isSignup}) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String name;
  String lastName;
  String email;
  String password;
  bool isSignup;

  @override
  void initState() {
    isSignup = widget.isSignup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Cadoo(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 20,
                left: _width * 0.075,
                right: _width * 0.075,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      isSignup
                          ? MetaText.createAnAccount
                          : MetaText.welcomeBack,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (isSignup)
                    LoginTextFormField(
                      key: ValueKey(MetaText.name),
                      hintText: MetaText.name,
                      onSaved: (String val) {
                        setState(() {
                          name = val;
                        });
                      },
                      validator: (String val) {
                        return null;
                      },
                    ),
                  if (isSignup)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: LoginTextFormField(
                        key: ValueKey(MetaText.lastName),
                        hintText: MetaText.lastName,
                        onSaved: (String val) {
                          setState(() {
                            lastName = val;
                          });
                        },
                        validator: (String val) {
                          return null;
                        },
                      ),
                    ),
                  LoginTextFormField(
                    key: ValueKey(MetaText.email),
                    hintText: MetaText.email,
                    onSaved: (String val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: ValidationHelper.validateEmailAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: LoginTextFormField(
                      key: ValueKey(MetaText.password),
                      hintText: MetaText.password,
                      onSaved: (String val) {
                        setState(() {
                          password = val;
                        });
                      },
                      validator: ValidationHelper.validatePassword,
                    ),
                  ),
                  AppRoundedButton(
                    width: _width * 0.9,
                    text: isSignup ? MetaText.signUp : MetaText.login,
                    onPressed: () {
                      // TODO:
                      Navigator.pushNamed(context, Routes.home);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: isSignup
                        ? RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'By creating an account you aggree to our ',
                                  style: TextStyle(
                                    color: MetaAsset.white,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: MetaAsset.white,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(
                                          'https://www.cadoo.io/image-licensing');
                                    },
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: MetaAsset.white,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: MetaAsset.white,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(
                                          'https://www.cadoo.io/privacy-polic');
                                    },
                                ),
                              ],
                            ),
                            maxLines: 3,
                          )
                        : Text(
                            MetaText.forgotPassword,
                            style: TextStyle(
                              color: MetaAsset.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          endIndent: 15,
                        ),
                      ),
                      Text(
                        'or',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          indent: 15,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 12.0),
                    child: Text(
                      isSignup ? MetaText.signUpWith : MetaText.signInWith,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(flex: 2),
                      AuthSocialButton(
                        text: MetaText.google,
                        asset: MetaAsset.google,
                        onTap: () {
                          // TODO:
                          Navigator.pushNamed(context, Routes.home);
                        },
                      ),
                      Spacer(flex: 1),
                      AuthSocialButton(
                        text: MetaText.facebook,
                        asset: MetaAsset.facebook,
                        onTap: () {
                          // TODO:
                          Navigator.pushNamed(context, Routes.home);
                        },
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 60),
                    child: Text(
                      isSignup
                          ? MetaText.haveAnAccount
                          : MetaText.dontHaveAnAccount,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    minWidth: _width * 0.85,
                    onPressed: () {
                      setState(() {
                        isSignup = !isSignup;
                      });
                    },
                    child: Text(
                      isSignup ? MetaText.login : MetaText.signUp,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(
                        color: MetaAsset.white,
                        width: 1.5,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 13),
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    Key key,
    this.onTap,
    this.text,
    this.asset,
  }) : super(key: key);
  final Function onTap;
  final String text;
  final String asset;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 80,
      minWidth: 80,
      padding: EdgeInsets.zero,
      color: MetaAsset.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) onSaved;
  final Function(String) validator;

  const LoginTextFormField({
    Key key,
    @required this.hintText,
    @required this.onSaved,
    @required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
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
          color: Colors.white70,
          fontSize: 16,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          gapPadding: 10,
          borderSide: BorderSide(color: Colors.red),
        ),
        fillColor: Colors.grey.shade900,
        filled: true,
      ),
      onSaved: onSaved,
      validator: validator,
      cursorColor: MetaAsset.white,
    );
  }
}
