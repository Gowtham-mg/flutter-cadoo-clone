import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/models/challenge_stat.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/utils/status_bar_color_changer.dart';
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
    image:
        'https://images.unsplash.com/photo-1540474565760-95c80cfdc021?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  );

  final Widget categoryDivider = Divider(
    color: MetaAsset.accentGreen,
    thickness: 0.75,
  );

  final Widget statDivider = Divider(
    color: Colors.grey,
    thickness: 0.75,
  );

  final int totalChallengeCount = 1;

  // TODO: remover later
  final String name = 'Gowtham';
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170 + MediaQuery.of(context).viewPadding.top,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
                bottom: 10,
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
                      Cadoo(
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: MetaAsset.comfortaa,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: MetaAsset.accentGreen,
                          size: 16,
                        ),
                        onPressed: () {
                          // TODO: Show notifications
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '${DateTimeHelper.greeting(currentTime)}, $name!',
                    style: TextStyle(
                      color: MetaAsset.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _width * 0.04,
                right: _width * 0.04,
                bottom: MediaQuery.of(context).viewPadding.bottom,
              ),
              child: Column(
                children: [
                  CategoryViewAll(
                    category: MetaText.newChallenges,
                    onTap: () {
                      // TODO: View all
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: SizedBox(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ChallengeDetailWidget(
                            challengeDetail: challengeDetail,
                            width: _width,
                          );
                        },
                      ),
                    ),
                  ),
                  categoryDivider,
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 12.5),
                    child: CategoryViewAll(
                      category: MetaText.myChallenges,
                      onTap: () {
                        // TODO: View all
                      },
                    ),
                  ),
                  ChallengeDetailWidget(
                    challengeDetail: challengeDetail,
                    width: _width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: categoryDivider,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      MetaText.stats,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  statDivider,
                  Row(
                    children: [
                      Text(
                        MetaText.totalChallenges,
                        style: TextStyle(
                          color: Colors.white70,
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
    );
  }
}
