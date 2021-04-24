import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  final int following = 0;
  final TextEditingController usernameController = TextEditingController();
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
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: MetaAsset.white, width: 1),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset(
                    MetaAsset.salary,
                    height: 80,
                    width: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          'Invite Friends for Rewards!',
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'When you refer someone they get \$1 towards challenges!',
                          style: TextStyle(color: MetaAsset.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(MetaText.searchAccountOnCadoo),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: MetaAsset.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: MetaAsset.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: MetaAsset.white, width: 1),
                ),
                fillColor: Colors.black87,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: _width * 0.05,
                  vertical: 8,
                ),
              ),
            ),
            Text('${MetaText.whoImFollowing} ($following)'),
            Text(MetaText.notFollowingAnyoneYet),
            // ignore: deprecated_member_use
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                MetaText.findFriends,
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
          ],
        ),
      ),
    );
  }
}
