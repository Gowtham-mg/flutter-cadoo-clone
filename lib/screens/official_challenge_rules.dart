import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class OfficialChallengeRules extends StatelessWidget {
  final TextStyle title = TextStyle(
    color: MetaAsset.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  final TextStyle boldDescription = TextStyle(
    color: MetaAsset.white,
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );

  final TextStyle description = TextStyle(
    color: MetaAsset.white,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        centerTitle: true,
        title: Text(
          'Official Challenge Rules',
          style: TextStyle(color: MetaAsset.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MetaAsset.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: _width * 0.05),
        children: [
          Text(
            'Cadoo Challenge Rules',
            style: TextStyle(color: MetaAsset.white, fontSize: 26),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Note', style: description),
          ),
          Text(
            'Apple does not sponsor Cadoo in any way. No prizes are provided by Apple.',
            style: description,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Game Duration', style: title),
          ),
          Text(
            "Cadoo challenges vary in length depending on the individual challenge's rules. During the course of the challenge, users must complete all of their required activity according to the activity schedule.",
            style: description,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Activity', style: title),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Activities are the various tasks users can do to win a Cadoo challenge. At the moment this includes walking, running, swimming, and cycling. All activities must be recorded through one of our partner services to count towards a Cadoo challenge. Currently you can record your activity with Strava, but in the future we plan on partnering with Garmin, Fitbit, and Healthkit. All players in a challenge are given the same activity schedule. Activity schedules vary depending on the individual challenge's rules, ",
                  style: description,
                ),
                TextSpan(
                  text: "but the following apply to all Cadoo Challenges:",
                  style: boldDescription,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              "Recording an activity beyond the minimum requirement is allowed, but will not reduce or replace future activities. Activities must be started and completed in the same calendar day, and will be officially counted when Cadoo verifies the activity. Each Challenge includes a minimum pace for each activity which can be found in the Challenges description. All activity must be tracked in one continuous session from start to finish.",
              style: description,
            ),
          ),
          Text('Challenge Variations', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Cadoo may make adjustments to the rules in individual challenges. You will be able to see any rule variations before you join a challenge.",
              style: description,
            ),
          ),
          Text('Activity Verification', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "All activities must be verified by Cadoo, meaning activities must be tracked and recorded using a supported run tracker app. Strava is currently supported, with tracking apps like Fitbit, Garmin, and healthkit coming out in the future. Other verification methods are not allowed (other running apps, photos of your watch, app screenshots, etc.). Players must first have (or create) an account with one of the supported activity trackers and give Cadoo permission to access activity data from it. The distance and duration of activity must be tracked directly by a phone or wearable tracker and may not be altered or entered manually. Players must sync their activity within 24 hours to make sure they count towards the challenge. If a player's phone or wearable activity tracker fails to track distance or duration for any reason, that run will not be counted. "),
                  TextSpan(
                    text:
                        "Cadoo cannot reverse disqualifications arising from uncharged, broken, unsynced, or lost devices. ",
                    style: boldDescription,
                  ),
                  TextSpan(
                    text:
                        "As part of our anti-cheating policing and general auditing measures, some players may be required to submit additional data from their phone or wearable device, including screenshots and background data. In certain circumstances, players may also be asked to capture or record additional information, such as videos of their indoor activity. In these cases, players will be contacted by Cadoo's support team with specific instructions. Compliance with such requests is mandatory. Non-compliance may result in ejection without a refund.",
                  )
                ],
                style: description,
              ),
            ),
          ),
          Text('Simultaneous Games', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Players may participate in more than one Cadoo challenge at a time. If a user loses a challenge, losing players are eligible to join another challenge immediately following their loss. ",
              style: description,
            ),
          ),
          Text('Winning', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Any player who completes all the requirements for their challenge, as verified by Cadoo, is a winner. If a player loses, he or she can continue to play along and enjoy the interactive features of the challenge but will not be eligible to share in the pot at the end.",
              style: description,
            ),
          ),
          Text('Payouts', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Winnings are deposited in your Cadoo account as Cadoo Points after a challenge ends. You may use your Cadoo Points in future challenges or request a payout of unused Points at any time. ",
                    style: description,
                  ),
                  TextSpan(
                      text:
                          "Payouts become available within 48 hours of being requested. After 12 months of inactivity, Points will expire.",
                      style: description)
                ],
              ),
            ),
          ),
          Text('Challenge Payment', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Entry fees must be paid up front. The entry fee amount for each challenge is set by Cadoo, and players can pay via PayPal or credit card.",
              style: description,
            ),
          ),
          Text('Refunds', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Players may receive a no-questions-asked refund until the challenge starts, or within 3 days of purchase, whichever is later. To do this please contact the customer service team by submitting a help request or emailing colm@cadoo.io.",
              style: description,
            ),
          ),
          Text('Disputes', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "All decisions by Cadoo Customer Support Team shall be considered final.",
              style: description,
            ),
          ),
          Text('Age Requirement', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Players must be at least 18 to participate in Cadoo.",
              style: description,
            ),
          ),
          Text('Prohibited Actions', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Players caught engaging in prohibited actions shall be ejected from Cadoo at the sole discretion of the Cadoo support team. Ejected players shall not be entitled to any refunds. The following actions are prohibited: Engaging in activities that falsely increase, decrease, or otherwise manipulate the mileage recorded. Manually adding mileage within the player's activity tracker. Tampering with the measurement reported by the player's activity tracker. Other activities determined to be unsportsmanlike by Cadoo Referees.",
              style: description,
            ),
          ),
          Text('Unsportsmanlike Activities', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Cadoo aims to create a supportive, fun environment that helps players become more active. Like any community, a few bad Cadoo apples can ruin the experience for everyone. To this end, Cadoo implores our players to adhere to the following guidelines of good sportsmanship, and to help enforce these standards among others, in order to bring out the best in everyone involved: No manipulating the challenge, including colluding, betting on a Cadoo that the player is not competing in, betting on someone other than yourself, betting on someone to lose, or otherwise interfering with the fair and natural course of the competition. No harassment of players. No embarrassment of players. No disclosing confidential information. No posting photos without the permission of the subject or the photographer. No gaming the system by creating multiple accounts. No business, product, or self-promotion posts in the challenge.",
              style: description,
            ),
          ),
          Text('Health Notification', style: title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "People get injured from running all the time. Players should participate in a Cadoo challenge only if their health permits it. Players should consult a qualified healthcare provider before participating particularly if they have known health issues that could be impacted by the activities required in this challenge. Participate in Cadoo challenges at your own risk. By playing, the player agrees to and acknowledges that Cadoo and its affiliates and partners, including technology partners and challenge hosts, shall not be responsible for any injuries or deaths that may arise from participation in this challenge. See Cadoo Terms of Use disclaimers.",
              style: description,
            ),
          ),
          Text('General', style: title),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Please review the Frequently Asked Questions (FAQ's) segment prepared for this challenge as it contains important information relating to your challenge participation. Your use of Cadoo's sites and software and your participation in Cadoo's challenges constitute acceptance of Cadoo's Terms and Conditions and its Privacy Policy, and any modifications that may be made to them over time.",
              style: description,
            ),
          ),
        ],
      ),
    );
  }
}
