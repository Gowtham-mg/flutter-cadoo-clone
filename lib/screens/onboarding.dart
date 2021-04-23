import 'dart:ui';
import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/utils/status_bar_color_changer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return StatusBarColorChanger(
      androidIconBrightness: Brightness.light,
      iosStatusBarBrightness: Brightness.light,
      androidStatusBarColor: MetaAsset.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MetaAsset.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView(
                    controller: pageViewController,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: _width * 0.15),
                        child: OnboardingItem(
                          image: MetaAsset.onboarding1,
                          title: MetaText.onboarding1Title,
                          subTitle: MetaText.onboarding1SubTitle,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: _width * 0.15),
                        child: OnboardingItem(
                          image: MetaAsset.onboarding2,
                          title: MetaText.onboarding2Title,
                          subTitle: MetaText.onboarding2SubTitle,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: _width * 0.15),
                        child: OnboardingItem3(
                          width: _width,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: pageViewController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (int val) {
                          pageViewController.animateToPage(
                            val,
                            duration: Duration(milliseconds: 150),
                            curve: Curves.bounceInOut,
                          );
                        },
                        effect: ColorTransitionEffect(
                          activeDotColor: MetaAsset.white,
                          dotColor: Color(0xFF4c4c4c),
                          dotHeight: 10,
                          dotWidth: 10,
                          radius: 5,
                          spacing: 10,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: EdgeInsets.only(
                          left: _width * 0.05,
                          right: _width * 0.05,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          child: Text(
                            MetaText.getStarted,
                            style: TextStyle(
                              color: MetaAsset.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              fontFamily: MetaAsset.roboto,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          minWidth: _width * 0.9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          color: MetaAsset.white,
                          onPressed: () {
                            // TODO:
                          },
                        ),
                      ),
                      Spacer(flex: 2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: MetaText.alreadyHaveAnAccount,
                              style: TextStyle(
                                color: MetaAsset.white,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: MetaText.login,
                              style: TextStyle(
                                color: MetaAsset.white,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO:
                                },
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    Key key,
    @required this.image,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          MetaText.cadoo,
          style: MetaStyles.onboardingAppNameStyle,
        ),
        Expanded(
          flex: 8,
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
        Text(
          title,
          style: MetaStyles.onboardingTitleStyle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            subTitle,
            style: MetaStyles.onboardingSubTitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}

class OnboardingItem3 extends StatelessWidget {
  const OnboardingItem3({
    Key key,
    @required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      Image.asset(
                        MetaAsset.onboarding3,
                        fit: BoxFit.cover,
                        width: width * 0.7,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          MetaText.cadoo,
                          style: MetaStyles.onboardingAppNameStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: constraints.maxHeight * 0.1),
                          child: Image.asset(
                            'assets/images/onboarding/money.png',
                            height: orientation == Orientation.portrait
                                ? constraints.maxWidth * 0.3
                                : constraints.maxHeight * 0.3,
                            width: orientation == Orientation.portrait
                                ? constraints.maxWidth * 0.3
                                : constraints.maxHeight * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
        Text(
          MetaText.onboarding3Title,
          style: MetaStyles.onboardingTitleStyle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            MetaText.onboarding3SubTitle,
            style: MetaStyles.onboardingSubTitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
