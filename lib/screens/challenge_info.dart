import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/utils/status_bar_color_changer.dart';
import 'package:cadoo/widgets/app_rounded_button.dart';
import 'package:flutter/material.dart';

class ChallengeInfo extends StatelessWidget {
  final TextStyle statTitle = TextStyle(
    color: MetaAsset.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double safeAreaBottom = MediaQuery.of(context).viewPadding.bottom;
    return StatusBarColorChanger(
      iosStatusBarBrightness: Brightness.dark,
      androidIconBrightness: Brightness.dark,
      androidStatusBarColor: MetaAsset.black,
      child: Scaffold(
        backgroundColor: MetaAsset.black,
        body: Stack(
          children: [
            Container(),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: MetaAsset.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    MetaText.letsWalkThroughCadoo,
                    style: TextStyle(color: MetaAsset.white),
                  ),
                  expandedHeight: 200,
                  toolbarHeight: 53,
                  pinned: true,
                  floating: true,
                  flexibleSpace: Image.network(
                    'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                    fit: BoxFit.cover,
                  ),
                  collapsedHeight: 55,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: _width * 0.05,
                      right: _width * 0.05,
                      top: 15,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'New to the app? Sign up for this low-stakes game and make sure everything is working. Walk 30 minutes a day for 2 day this week',
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('STARTS: ', style: MetaStyles.darkGrey),
                              Text('JOIN BEFORE: ', style: MetaStyles.darkGrey),
                              Text('ENDS: ', style: MetaStyles.darkGrey),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            statItem('25 members', Icons.people),
                            statItem('50.00 in prize pool', Icons.attach_money),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            child: Row(
                              children: [
                                Text(
                                  MetaText.viewVoucherDetails,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.white60),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.officialChallengeRules,
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bet amount',
                                    style: MetaStyles.darkGrey
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    '\$2',
                                    style: TextStyle(
                                      color: MetaAsset.accentGreen,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Host',
                                    style: MetaStyles.darkGrey
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text('Cadoo', style: statTitle),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Required',
                                      style: MetaStyles.darkGrey
                                          .copyWith(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1579623261984-41f9a81d4044?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVkJTIwbG9nb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text('  Strava', style: statTitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Challenge Type',
                                      style: MetaStyles.darkGrey
                                          .copyWith(fontSize: 16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          child: Icon(
                                            Icons.directions_walk,
                                            size: 12,
                                          ),
                                        ),
                                        Text('  Walk', style: statTitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              Text(
                                MetaText.needHelpAskUsAnything,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.white60),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.contactSupport,
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 60, bottom: 15),
                          child: Text(
                            MetaText.challengeHasntStartedYet,
                            style: TextStyle(
                              color: MetaAsset.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          color: MetaAsset.accentGreen,
                          minWidth: _width * 0.9,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            MetaText.inviteAFriendToThisChallenge,
                            style: TextStyle(
                              color: MetaAsset.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, bottom: safeAreaBottom + 40),
                          child:
                              Text(MetaText.keepYourselfAccountableAndInvite),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: safeAreaBottom + 20,
              left: _width * 0.05,
              child: AppRoundedButton(
                text: MetaText.joinThisChallenge,
                width: _width * 0.9,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded statItem(final String text, final IconData icon) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Icon(icon, color: MetaAsset.white),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: MetaStyles.onboardingSubTitleStyle,
            ),
          )
        ],
      ),
    );
  }
}
