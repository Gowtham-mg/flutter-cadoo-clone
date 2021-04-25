import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
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
          radius: 14,
          backgroundColor: MetaAsset.black,
          child: Icon(
            icon,
            color: MetaAsset.accentGreen,
            size: 15,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              stat,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}

class ChallengeDetailWidget extends StatelessWidget {
  final double width;
  final ChallengeDetail challengeDetail;

  const ChallengeDetailWidget({
    Key key,
    @required this.challengeDetail,
    @required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.85,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: NetworkImage(challengeDetail.image),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.only(right: width * 0.05),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                  child: Text(
                    challengeDetail.title,
                    style: TextStyle(
                      color: MetaAsset.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
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
                      child: Image.network(
                        challengeDetail.icon,
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    Visibility(
                      visible: challengeDetail.isJoined,
                      child: Padding(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  CategoryViewAll({
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
        Text(category, style: MetaStyles.categoryStyle),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(MetaText.viewAll, style: MetaStyles.categoryStyle),
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
