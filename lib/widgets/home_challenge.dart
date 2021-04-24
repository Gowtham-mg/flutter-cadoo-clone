import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/challenge_detail.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:flutter/material.dart';

class ChallengeStatBadge extends StatelessWidget {
  const ChallengeStatBadge({
    Key key,
    @required this.icon,
    @required this.stat,
  }) : super(key: key);

  final IconData icon;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: MetaAsset.black,
          child: Icon(
            icon,
            color: MetaAsset.accentGreen,
            size: 6,
          ),
        ),
        Text(
          '  $stat',
          style: TextStyle(
            color: MetaAsset.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ChallengeDetailWidget extends StatelessWidget {
  final String image;
  final double width;
  final ChallengeDetail challengeDetail;

  const ChallengeDetailWidget({
    Key key,
    @required this.image,
    @required this.challengeDetail,
    @required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.only(right: width * 0.05),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
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
                    fontSize:
                        challengeDetail.description.length <= 30 ? 18 : 13,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Spacer(),
                Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        challengeDetail.icon,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    if (challengeDetail.isJoined)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          MetaText.joined,
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ChallengeStatBadge(
                  icon: Icons.people,
                  stat: challengeDetail.challengeStat.participants.toString(),
                ),
                ChallengeStatBadge(
                  icon: Icons.attach_money,
                  stat: challengeDetail.challengeStat.prizePool.toString(),
                ),
                ChallengeStatBadge(
                  icon: Icons.calendar_today,
                  stat: DateTimeHelper.statCalendarDay(
                    challengeDetail.challengeStat.startDate,
                    challengeDetail.challengeStat.endDate,
                  ),
                ),
                ChallengeStatBadge(
                  icon: Icons.calendar_today,
                  stat: DateTimeHelper.statEndRegistrationDay(
                    challengeDetail.challengeStat.registrationEndDate,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryViewAll extends StatelessWidget {
  const CategoryViewAll({
    Key key,
    @required this.category,
    @required this.onTap,
  }) : super(key: key);

  final String category;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(category),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(MetaText.viewAll),
              Icon(
                Icons.arrow_forward,
                color: MetaAsset.accentGreen,
              )
            ],
          ),
        )
      ],
    );
  }
}
