import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectionItem {
  final String image;
  final String name;
  final bool isConnected;
  final String launchUrl;

  const ConnectionItem(this.image, this.name, this.isConnected, this.launchUrl);
  const ConnectionItem.named(
      {this.image, this.name, this.isConnected, this.launchUrl});
}

const List<ConnectionItem> connectionItems = [
  ConnectionItem.named(
    image:
        "https://1000logos.net/wp-content/uploads/2017/09/Fitbit-Logo-500x313.png",
    name: "Fitbit",
    isConnected: false,
    launchUrl:
        "https://accounts.fitbit.com/login?targetUrl=https%3A%2F%2Fwww.fitbit.com%2Flogin%2Ftransferpage%3Fredirect%3Dhttps%25253A%25252F%25252Fwww.fitbit.com%25252Foauth2%25252Fauthorize%25253Fclient_id%25253D22BZN2%252526redirect_uri%25253Dhttps%2525253A%2525252F%2525252Fsrv.api.cadoo.io%2525252Fapi%2525252Fconnections%2525252Ffitbit%2525252FredirectUrl%252526response_type%25253Dcode%252526scope%25253Dactivity%25252Bheartrate%25252Blocation%25252Bnutrition%25252Bprofile%25252Bsettings%25252Bsleep%25252Bsocial%25252Bweight%252526state%25253D07b94346-5b3e-4c08-add3-6668bcb92949&lcl=en_IN",
  ),
  ConnectionItem.named(
    image:
        "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/323_Strava_logo-512.png",
    name: "Strava",
    isConnected: false,
    launchUrl: "https://www.strava.com/login",
  ),
  ConnectionItem.named(
    image: "https://fontmeme.com/images/garmin-logo.jpg",
    name: "Garmin",
    isConnected: false,
    launchUrl:
        "https://connect.garmin.com/oauthConfirm?oauth_callback=https%3A%2F%2Fsrv.api.cadoo.io%2Fapi%2Fconnections%2Fgarmin%2FredirectUrl%3FuserId%3D07b94346-5b3e-4c08-add3-6668bcb92949&oauth_token=21e31f44-eac1-48da-8ada-a8f13114411a",
  ),
];

class ConnectionsScreen extends StatelessWidget {
  final TextStyle accentStyle = TextStyle(
    color: MetaAsset.accentGreen,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  maintainSize: true,
                  visible: false,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                Text(
                  MetaText.connections,
                  style: TextStyle(
                    color: MetaAsset.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.contact_support,
                    color: MetaAsset.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.connectionSupport);
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _width * 0.05,
                top: 40,
                right: _width * 0.05,
                bottom: 6,
              ),
              child: accentTitle(MetaText.connected),
            ),
            Container(
              color: Colors.grey.shade800,
              padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Choose a tracker below to connect',
                style: TextStyle(
                  color: MetaAsset.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  accentTitle(MetaText.notConnected),
                  ...connectionItems
                      .map((e) => NotConnectedItems(item: e))
                      .toList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Health integrations are not connected like other integrations. Cadoo syncs with Health integrations whenever user opens the Cadoo app or simply tap the sync button down below ",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                      horizontal: _width * 0.05,
                      vertical: 10,
                    ),
                    color: Colors.blue.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Sync your Google Fit Data',
                            style: TextStyle(color: MetaAsset.white),
                          ),
                        ),
                        Icon(
                          Icons.healing,
                          color: MetaAsset.white,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Questions about supported trackers?",
                        style: accentStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.contactSupport);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      height: 0,
                      minWidth: 0,
                      color: Colors.grey.shade800,
                      child: Text(
                        "Ask Us",
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text accentTitle(final String title) {
    return Text(
      title,
      style: accentStyle,
    );
  }
}

class NotConnectedItems extends StatelessWidget {
  const NotConnectedItems({
    Key key,
    @required this.item,
  }) : super(key: key);
  final ConnectionItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(
            item.image,
            height: 60,
            width: 60,
            fit: BoxFit.fill,
            color: item.name == 'Fitbit' ? Colors.white : null,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                item.name,
                style: TextStyle(
                  color: MetaAsset.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          TextButton(
            child: Text(
              item.isConnected ? MetaText.disconnect : MetaText.connect,
              style: TextStyle(color: MetaAsset.accentGreen),
            ),
            onPressed: () {
              launch(item.launchUrl);
            },
          )
        ],
      ),
    );
  }
}
