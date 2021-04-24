import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
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
          MetaText.followers,
          style: TextStyle(
            color: MetaAsset.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              MetaText.noFollowersYet,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  MetaText.funWithFriends,
                  style: TextStyle(
                    color: MetaAsset.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.05,
                  vertical: 6,
                ),
                onPressed: () {
                  // TODO:
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
