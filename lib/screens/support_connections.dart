import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class SupportConnections extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: MetaAsset.white,
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MetaAsset.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          MetaText.connections,
          style: TextStyle(color: MetaAsset.white),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "In order for you to send and receive challenges on Cadoo, you need to connect your Cadoo account to the app you want to use. Once connected, the slider next to that service will be displayed as blue.",
              style: style,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "To view tutorials on how to connect an app to Cadoo, click on one of the links below.",
                style: style,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Fitbit • 10S-Health *Coming Soon!*", style: style),
                  Text("• Strava *Coming Soon!*", style: style),
                  Text("• DuoLingo *Coming Soon!*", style: style),
                  Text("• MIMO *Coming Soon!*", style: style),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
