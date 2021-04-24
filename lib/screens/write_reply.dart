import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/app_rounded_button.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WriteReply extends StatelessWidget {
  final TextStyle nameStyle = TextStyle(
    color: MetaAsset.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 35),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: MetaAsset.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 25, right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 8,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 4,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      radius: 3,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Gowtham',
                                  style: nameStyle,
                                ),
                                Text(
                                  'Away',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          '${DateTimeHelper.currentTime(DateTime.now())} in Tamil Nadu, India',
                          style: nameStyle,
                        ),
                      ],
                    ),
                  ),
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
          ),
          Container(
            color: MetaAsset.white,
            padding: EdgeInsets.only(
              top: 6,
              bottom: 10,
              left: _width * 0.05,
              right: _width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateTimeHelper.getContactDate(DateTime.now()),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: _width * 0.05,
                    right: _width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Gowtham',
                              style: TextStyle(
                                color: MetaAsset.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 10),
                        child: Text(
                          'Want to host your own Cadoo challenge? ',
                          style: MetaStyles.contactDialogStyle,
                        ),
                      ),
                      Text(
                        'Beta test this new feature! ',
                        style: MetaStyles.contactDialogStyle,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• Fill out our survey',
                              style: MetaStyles.contactDialogStyle,
                            ),
                            Text(
                              '• Get sent your own custom challenge!',
                              style: MetaStyles.contactDialogStyle,
                            )
                          ],
                        ),
                      ),
                      AppRoundedButton(
                        text: MetaText.getStarted,
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: MetaAsset.roboto,
                        ),
                        onPressed: () {
                          // TODO:
                        },
                        buttonColor: MetaAsset.black,
                        width: _width * 0.75,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    launch(
                        'https://www.intercom.com/intercom-link?user_id=6083157e00ae5b78e2d3df9a&powered_by_app_id=cau3k93n&company=Cadoo&solution=onboarding&utm_source=android-sdk&utm_campaign=intercom-link&utm_content=4+conversation+we-run-on-intercom&utm_medium=messenger');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(MetaAsset.intercomm, height: 20, width: 20),
                      Text(
                        'We run on Intercom',
                        style: MetaStyles.intercommStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
