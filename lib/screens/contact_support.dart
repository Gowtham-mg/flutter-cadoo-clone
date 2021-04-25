import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
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
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  width: _width,
                  child: ContactSupportHeader(width: _width),
                ),
                Positioned(
                  top: 170,
                  width: _width * 0.9,
                  left: _width * 0.05,
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
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Gowtham',
                                                  style: MetaStyles.darkGrey),
                                              Text(
                                                '${DateTimeHelper.statCalendarDay(
                                                  DateTime.now().subtract(
                                                      Duration(days: 1)),
                                                  DateTime.now(),
                                                )} ago',
                                                style: MetaStyles.darkGrey,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Want to host your own Cadoo challenge?',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // ignore: deprecated_member_use
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      side: BorderSide(
                                        color: MetaAsset.black,
                                        width: 1,
                                      ),
                                    ),
                                    color: MetaAsset.white,
                                    minWidth: 0,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.send,
                                          color: MetaAsset.black,
                                          size: 15,
                                        ),
                                        Text(
                                          '  Send us a message',
                                          style: TextStyle(
                                            color: MetaAsset.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      // TODO:
                                    },
                                  ),
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
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                ),
                                margin: EdgeInsets.only(top: 8),
                                width: (_width * 0.9) - 30,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SearchArticleDialog(
                                                darkGrey: MetaStyles.darkGrey,
                                              );
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            MetaText.searchOurArticles,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                      color: MetaAsset.black,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: MetaAsset.white,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        // TODO: Article search
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: MetaAsset.white,
            padding: EdgeInsets.symmetric(vertical: 15),
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
                    '  We run on Intercom',
                    style: MetaStyles.darkGrey.copyWith(fontSize: 16),
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

class ContactSupportHeader extends StatelessWidget {
  const ContactSupportHeader({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MetaAsset.black,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 80,
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2.5,
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: MetaAsset.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
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
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchArticleDialog extends StatelessWidget {
  const SearchArticleDialog({
    Key key,
    @required this.darkGrey,
  }) : super(key: key);

  final TextStyle darkGrey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MetaAsset.black,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MetaAsset.black,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MetaAsset.black,
              width: 2,
            ),
          ),
          filled: true,
          enabled: true,
          fillColor: MetaAsset.white,
          hintText: MetaText.searchOurArticles,
          hintStyle: darkGrey.copyWith(fontSize: 18),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            MetaText.cancel,
            style: TextStyle(color: MetaAsset.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            MetaText.ok,
            style: TextStyle(color: MetaAsset.black),
          ),
        )
      ],
    );
  }
}
