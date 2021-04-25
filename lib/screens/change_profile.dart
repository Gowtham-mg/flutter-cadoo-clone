import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/screens/profile/edit_profile.dart';
import 'package:cadoo/widgets/edit_profile_text_form_field.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class ChangeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        centerTitle: true,
        title: Text(
          'Change Profile',
          style: TextStyle(color: MetaAsset.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MetaAsset.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SingleChildScrollView(
        child: EditProfileContainer(
          title: "Set a new password",
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: EditProfileTextFormField(
                hintText: MetaText.password,
                onSaved: (String val) {},
                validator: (String val) {
                  return null;
                },
              ),
            ),
            EditProfileTextFormField(
              hintText: MetaText.newpassword,
              onSaved: (String val) {},
              validator: (String val) {
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: EditProfileTextFormField(
                hintText: MetaText.reenterNewPassword,
                onSaved: (String val) {},
                validator: (String val) {
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                color: MetaAsset.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      Icon(Icons.send, color: MetaAsset.black),
                      Text(
                        '  Submit',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
