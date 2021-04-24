import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class VoucherDetails extends StatelessWidget {
  final TextStyle boldStyle = TextStyle(
    color: MetaAsset.white,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: MetaAsset.roboto,
    height: 1.3,
  );
  final TextStyle normalStyle = TextStyle(
    color: MetaAsset.white,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: MetaAsset.roboto,
    height: 1.3,
  );

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
          MetaText.cadooPoints,
          style: TextStyle(
            color: MetaAsset.white,
            fontFamily: MetaAsset.comfortaa,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: _width * 0.05,
          right: _width * 0.05,
          top: 25,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: "\nYou can earn Challenge Vouchers by: ",
                    style: boldStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Referring friends or being referred to Cadoo. ",
                    style: normalStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    // ignore: deprecated_member_use
                    child: FlatButton(
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
                  ),
                  Text(
                    "• Clicking on special links we'll occasionally send out 😉",
                    style: normalStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text('Need More Help? ', style: boldStyle),
            ),
            InkWell(
              child: Text(
                'Contact our support team ',
                style: boldStyle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
