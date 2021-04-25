import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/utils/validation_helper.dart';
import 'package:cadoo/widgets/edit_profile_text_form_field.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  final double balance = 0.0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MetaAsset.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _height * 0.1, bottom: 20),
            child: Text(
              '\$${balance.toStringAsFixed(2)}',
              style: MetaStyles.balanceStyle,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(
              left: _width * 0.05,
              right: _width * 0.05,
              top: 15,
              bottom: 15,
            ),
            margin: EdgeInsets.symmetric(horizontal: _width * 0.05),
            child: Column(
              children: [
                EditProfileTextFormField(
                  hintText: MetaText.recipientEmail,
                  validator: ValidationHelper.validateEmailAddress,
                  onSaved: (String val) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: EditProfileTextFormField(
                    hintText: MetaText.amount,
                    validator: (String val) {
                      double _amount = double.tryParse(val);
                      if (_amount == null) {
                        return 'Please enter a valid amount';
                      } else if (_amount < balance) {
                        return 'Entered amount cannot be less than the balance amount';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String val) {},
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  color: MetaAsset.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.money_rounded,
                        color: MetaAsset.black,
                        size: 25,
                      ),
                      Text(
                        '  ${MetaText.requestPayout}',
                        style: TextStyle(
                          color: MetaAsset.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
