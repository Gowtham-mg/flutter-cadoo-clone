import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:flutter/material.dart';

class VoucherDetails extends StatelessWidget {
  final TextStyle boldStyle = TextStyle(
    color: MetaAsset.white,
    fontWeight: FontWeight.w600,
    fontFamily: MetaAsset.roboto,
  );
  final TextStyle normalStyle = TextStyle(
    color: MetaAsset.white,
    fontWeight: FontWeight.w600,
    fontFamily: MetaAsset.roboto,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            MetaText.cadooPoints,
            style: TextStyle(color: MetaAsset.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "A challenge voucher ",
                    style: boldStyle,
                  ),
                  TextSpan(
                    text:
                        "is a discount that can be applied to any Cadoo challenge. For example, with a \$5 challenge voucher can join a \$25 dollar challenge for \$20. \n",
                    style: normalStyle,
                  ),
                  TextSpan(
                    text: "You can earn Challenge Vouchers by: ",
                    style: boldStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    "• Referring friends or being referred to Cadoo. ",
                    style: normalStyle,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                        color: MetaAsset.white,
                        width: 1,
                      ),
                    ),
                    color: MetaAsset.black,
                    child: Text(
                      'Referrals Page',
                      style: TextStyle(
                        color: MetaAsset.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "• Clicking on special links we'll occasionally send out 😉",
                    style: normalStyle,
                  )
                ],
              ),
            ),
            Text('Need More Help? ', style: boldStyle),
            InkWell(
              child: Text(
                'Contact our support team ',
                style: boldStyle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
