import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/widgets/profile_header.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class WinnersProfile extends StatelessWidget {
  final String name = 'Gowtham M G';

  final int followers = 0;
  final int currentChallengesCount = 384;
  final int following = 0;

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

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MetaAsset.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: Column(
        children: [
          ProfileHeader(
            width: _width,
            name: name,
            followers: followers,
            following: following,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
                bottom: BorderSide(color: Colors.white70, width: 1),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              MetaText.challenges,
              style: TextStyle(
                color: MetaAsset.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 6),
            child: Text(
              '${MetaText.currentChallenges} ($currentChallengesCount)',
              style: TextStyle(color: MetaAsset.white, fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 384,
              padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: _width * 0.85,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(challengeDetail.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.only(right: _width * 0.05),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challengeDetail.title,
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        challengeDetail.description,
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: challengeDetail.description.length <= 30
                              ? 18
                              : 13,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Spacer(),
                      ClipRRect(
                        child: Image.network(
                          challengeDetail.icon,
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
