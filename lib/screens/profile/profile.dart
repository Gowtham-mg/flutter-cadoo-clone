import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/models/challenge_stat.dart';
import 'package:cadoo/models/transaction.dart';
import 'package:cadoo/screens/balance/funds_screen.dart';
import 'package:cadoo/widgets/home_challenge.dart';
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
    challengeStat: ChallengeStat.named(
      participants: 1,
      prizePool: 6.5,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 30)),
      registrationEndDate: DateTime.now().add(Duration(days: 10)),
    ),
  );

  final Transaction transaction = Transaction.named(
    amount: 0,
    currency: '\$',
    date: DateTime.now(),
    title: 'Total Balance',
  );

  final Divider statDivider = Divider(
    color: Colors.grey,
    thickness: 0.075,
    height: 5,
  );

  String selectedMode = MetaText.myChallenges.toUpperCase();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        title: Text(
          MetaText.myProfile,
          style: TextStyle(color: MetaAsset.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: MetaAsset.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 25,
                bottom: 8,
                left: _width * 0.05,
                right: _width * 0.05,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                color: MetaAsset.white,
                                width: 1,
                              ),
                            ),
                            color: MetaAsset.black,
                            child: Text(
                              MetaText.editProfile,
                              style: TextStyle(
                                color: MetaAsset.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [
                            Text(
                              '$followers FOLLOWERS',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '$following FOLLOWING',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              onTap: (int index) {},
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              tabs: [
                ToggleProfileButton(
                  text: MetaText.myChallenges.toUpperCase(),
                  isSelected:
                      selectedMode == MetaText.myChallenges.toUpperCase(),
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
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: _width * 0.05,
                      right: _width * 0.05,
                      bottom: 5,
                    ),
                    child: Text(
                      MetaText.joinedChallenges,
                      style: TextStyle(color: MetaAsset.white, fontSize: 16),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return ChallengeDetailWidget(
                        image:
                            'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
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
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: MetaText.notVisibleToOthers,
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
                            builder: (BuildContext context) =>
                                MyBalanceScreen(),
                          ),
                        );
                      },
                    ),
                    statDivider,
                    Text(
                      MetaText.stats,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 18,
                      ),
                    ),
                    statDivider,
                    Row(
                      children: [
                        Text(
                          MetaText.totalChallenges,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '$totalChallenges',
                          style: TextStyle(
                            color: MetaAsset.accentGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    statDivider,
                  ],
                ),
              ),
            )
          ],
        ),
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
        onPressed: () {},
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
