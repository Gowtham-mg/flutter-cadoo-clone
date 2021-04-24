import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/models/challenge_stat.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/cadoo.dart';
import 'package:cadoo/widgets/home_challenge.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final DateTime currentTime = DateTime.now();
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

  final Widget categoryDivider = Divider(
    color: Colors.white70,
    thickness: 1.5,
    indent: 5,
    endIndent: 5,
  );

  final Widget statDivider = Divider(
    color: Colors.grey,
    thickness: 1,
    indent: 5,
    endIndent: 5,
  );

  final int totalChallengeCount = 1;

  // TODO: remover later
  final String name = 'Gowtham';
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MetaAsset.black,
      body: SizedBox(
        width: _width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(
                  bottom: 10,
                  top: 10 + MediaQuery.of(context).viewPadding.top,
                ),
                margin: EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            MetaAsset.menu,
                            color: MetaAsset.white,
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            // TODO: Open Drawer
                          },
                        ),
                        Spacer(),
                        Cadoo(),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: MetaAsset.accentGreen,
                          ),
                          onPressed: () {
                            // TODO: Show notifications
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      // TODO: get name from firebase
                      child: Text(
                        '${DateTimeHelper.greeting(currentTime)}, $name!',
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.04),
                child: Column(
                  children: [
                    CategoryViewAll(
                      category: MetaText.newChallenges,
                      onTap: () {
                        // TODO: View all
                      },
                    ),
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return ChallengeDetailWidget(
                          image:
                              'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                          challengeDetail: challengeDetail,
                          width: _width,
                        );
                      },
                    ),
                    categoryDivider,
                    CategoryViewAll(
                      category: MetaText.newChallenges,
                      onTap: () {
                        // TODO: View all
                      },
                    ),
                    ChallengeDetailWidget(
                      image:
                          'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                      challengeDetail: challengeDetail,
                      width: _width,
                    ),
                    categoryDivider,
                    Text(
                      MetaText.stats,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    statDivider,
                    Row(
                      children: [
                        Text(
                          MetaText.totalChallenges,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          totalChallengeCount.toString(),
                          style: TextStyle(
                            color: MetaAsset.accentGreen,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    statDivider,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
