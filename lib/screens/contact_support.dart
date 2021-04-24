import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.white70,
                ),
                Container(
                  color: MetaAsset.black,
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 50,
                    left: _width * 0.05,
                    right: _width * 0.05,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Text(
                                'C',
                                style: TextStyle(
                                  color: MetaAsset.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: MetaAsset.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Hi there 👋',
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Ask us anything, or share your feedback.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                    child: Column(
                      children: [
                        Card(
                          color: MetaAsset.white,
                          margin: EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text(
                                  'Your conversations',
                                  style: TextStyle(
                                    color: MetaAsset.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Gowtham',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${DateTimeHelper.statCalendarDay(
                                                DateTime.now().subtract(
                                                    Duration(days: 1)),
                                                DateTime.now(),
                                              )} ago',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Want to host your own Cadoo challenge?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () {
                                    // TODO:
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    side: BorderSide(
                                      color: MetaAsset.black,
                                      width: 1,
                                    ),
                                  ),
                                  color: MetaAsset.white,
                                  child: Row(
                                    children: [
                                      Icon(Icons.send, color: MetaAsset.black),
                                      Text(
                                        'Send us a message',
                                        style: TextStyle(
                                          color: MetaAsset.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Find your answer now',
                                  style: TextStyle(
                                    color: MetaAsset.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                    ),
                                    margin: EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            child: Text(
                                              'Search our articles',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: MetaAsset.black,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: MetaAsset.white,
                                            size: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: MetaAsset.white,
            padding: EdgeInsets.symmetric(vertical: 6),
            child: InkWell(
              onTap: () {
                launch(
                    'https://www.intercom.com/intercom-link?user_id=6083157e00ae5b78e2d3df9a&powered_by_app_id=cau3k93n&company=Cadoo&solution=onboarding&utm_source=android-sdk&utm_campaign=intercom-link&utm_content=4+conversation+we-run-on-intercom&utm_medium=messenger');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MetaAsset.intercomm, height: 20, width: 20),
                  Text(
                    'We run on Intercom',
                    style: MetaStyles.intercommStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
