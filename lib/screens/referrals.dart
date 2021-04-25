import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Referrals extends StatelessWidget {
  final TextStyle title = TextStyle(
    color: MetaAsset.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  // TODO: Add share with twitter, facebook, mail, other share
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "It's More Fun with Friends!",
          style: TextStyle(color: MetaAsset.white),
        ),
        centerTitle: true,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: 10.0, bottom: 20, left: _width * 0.05, right: _width * 0.05),
        child: Column(
          children: [
            Text('My Referral Code', style: title),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: MetaAsset.white,
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Icon(Icons.qr_code, color: MetaAsset.black, size: 150),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: MetaAsset.white, width: 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: _width * 0.04),
                    child: Text(
                      'url',
                      style: TextStyle(
                        color: MetaAsset.accentGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: 'url'));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Referral code copied to Clipboard!',
                        style: TextStyle(color: MetaAsset.black, fontSize: 13),
                      ),
                      backgroundColor: MetaAsset.accentGreen,
                      duration: Duration(milliseconds: 1500),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  padding: EdgeInsets.all(10),
                  color: MetaAsset.white,
                  minWidth: 30,
                  child: Icon(
                    Icons.copy,
                    color: MetaAsset.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReferralSocialButton(
                    asset: MetaAsset.twitter,
                    onPressed: () {},
                  ),
                  ReferralSocialButton(
                    asset: MetaAsset.facebookReferral,
                    onPressed: () {},
                  ),
                  ReferralSocialButton(
                    asset: MetaAsset.share,
                    onPressed: () {},
                  ),
                  ReferralSocialButton(
                    asset: MetaAsset.envelope,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("People I've invited", style: title),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Nobody shared your code yet, keep sharing the Cadoo love 💛',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReferralSocialButton extends StatelessWidget {
  const ReferralSocialButton({
    Key key,
    @required this.onPressed,
    @required this.asset,
  }) : super(key: key);
  final Function onPressed;
  final String asset;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      color: MetaAsset.white,
      shape: CircleBorder(),
      height: 40,
      minWidth: 40,
      padding: EdgeInsets.zero,
      child: Image.asset(
        asset,
        height: 20,
        width: 20,
        fit: BoxFit.cover,
      ),
      onPressed: onPressed,
    );
  }
}
