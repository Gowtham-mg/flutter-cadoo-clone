import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/models/transaction.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/screens/balance/funds_screen.dart';
import 'package:cadoo/widgets/home_challenge.dart';
import 'package:cadoo/widgets/profile_header.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String name = 'Gowtham M G';

  final int followers = 0;

  final int following = 0;
  final int totalChallenges = 1;

  final ChallengeDetail challengeDetail = ChallengeDetail.named(
    title: '40 for May',
    isJoined: false,
    description:
        'You have to run 40 miles total. Do you have what it takes? Tak on May and go for 40. Runs only. Runs must be a 16 minute mile pace or faster',
    icon:
        'https://images.unsplash.com/photo-1579623261984-41f9a81d4044?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVkJTIwbG9nb3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    image:
        'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  );

  final Transaction transaction = Transaction.named(
    amount: 0,
    currency: '\$',
    date: DateTime.now(),
    title: 'Total Balance',
  );

  String selectedMode = MetaText.myChallenges.toUpperCase();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  maintainSize: true,
                  visible: false,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                Text(
                  MetaText.myProfile,
                  style: TextStyle(
                    color: MetaAsset.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: MetaAsset.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.changeProfile);
                  },
                )
              ],
            ),
          ),
          ProfileHeader(
            width: _width,
            name: name,
            followers: followers,
            following: following,
          ),
          // TabBar(
          //   onTap: (int index) {},
          //   indicator: BoxDecoration(
          //     border: Border(
          //       top: BorderSide(
          //         color: Colors.grey,
          //         width: 0.5,
          //       ),
          //       bottom: BorderSide(
          //         color: Colors.grey,
          //         width: 0.5,
          //       ),
          //     ),
          //   ),
          //   tabs: [
          //   ],
          // ),
          Row(
            children: [
              ToggleProfileButton(
                text: MetaText.myChallenges.toUpperCase(),
                isSelected: selectedMode == MetaText.myChallenges.toUpperCase(),
                onPressed: () {
                  setState(() {
                    selectedMode = MetaText.myChallenges.toUpperCase();
                  });
                },
              ),
              ToggleProfileButton(
                text: MetaText.myStats,
                isSelected: selectedMode == MetaText.myStats,
                onPressed: () {
                  setState(() {
                    selectedMode = MetaText.myStats;
                  });
                },
              ),
            ],
          ),
          Visibility(
            visible: selectedMode == MetaText.myChallenges.toUpperCase(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: _width * 0.05,
                    bottom: 5,
                  ),
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${MetaText.joinedChallenges} (1)',
                    style: TextStyle(color: MetaAsset.white, fontSize: 16),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return ChallengeDetailWidget(
                      challengeDetail: challengeDetail,
                      width: _width,
                    );
                  },
                )
              ],
            ),
          ),
          Visibility(
            visible: selectedMode == MetaText.myStats,
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                left: _width * 0.05,
                right: _width * 0.05,
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: MetaText.balance,
                            style: TextStyle(
                              color: MetaAsset.white,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: '  ${MetaText.notVisibleToOthers}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      '${transaction.currency}${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: MetaAsset.white,
                      size: 22,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyBalanceScreen(),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: _width * 0.9,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      MetaText.stats.toUpperCase(),
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          MetaText.totalChallenges,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '$totalChallenges',
                          style: TextStyle(
                            color: MetaAsset.accentGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ToggleProfileButton extends StatelessWidget {
  const ToggleProfileButton({
    Key key,
    @required this.text,
    @required this.isSelected,
    @required this.onPressed,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: onPressed,
        shape: isSelected
            ? ContinuousRectangleBorder(
                side: BorderSide(color: MetaAsset.white, width: 1),
              )
            : null,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? MetaAsset.white : Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      flex: 1,
    );
  }
}
