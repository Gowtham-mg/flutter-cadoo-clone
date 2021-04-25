import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/routes.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.width,
    @required this.name,
    @required this.followers,
    @required this.following,
  }) : super(key: key);

  final double width;
  final String name;
  final int followers;
  final int following;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        bottom: 8,
        left: width * 0.05,
        right: width * 0.05,
      ),
      width: width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: MetaAsset.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.editProfile);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(
                        color: MetaAsset.white,
                        width: 1,
                      ),
                    ),
                    color: MetaAsset.black,
                    child: Text(
                      MetaText.editProfile,
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runAlignment: WrapAlignment.start,
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      height: 0,
                      child: Text(
                        '$followers FOLLOWERS',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.followers);
                      },
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      height: 0,
                      child: Text(
                        '$following FOLLOWING',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.following);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
