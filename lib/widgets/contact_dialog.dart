import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/widgets/app_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: MetaAsset.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8,
                left: _width * 0.05,
                right: _width * 0.05,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gowtham',
                          style: TextStyle(
                            color: MetaAsset.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Away',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Divider(color: Colors.grey, thickness: 0.75),
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                launch('https://slyk.typeform.com/to/uyzx1W4m');
              },
              buttonColor: MetaAsset.black,
              width: _width * 0.75,
            ),
            Spacer(),
            Divider(
              color: Colors.grey,
              thickness: 0.75,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: _width * 0.05,
                ),
                child: Text(
                  'Write a reply...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.writeReply);
              },
            )
          ],
        ),
      ),
    );
  }
}
