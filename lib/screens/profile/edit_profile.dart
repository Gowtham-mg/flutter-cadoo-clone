import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/profile.dart';
import 'package:cadoo/utils/validation_helper.dart';
import 'package:cadoo/widgets/edit_profile_text_form_field.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _editProfileKey = GlobalKey<ScaffoldState>();

  Profile profile = Profile.named();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        backgroundColor: MetaAsset.black,
        title: Text(
          MetaText.editProfile,
          style: TextStyle(
            color: MetaAsset.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: MetaAsset.white,
            ),
            onPressed: () {
              // TODO: Save profile
              Navigator.pop(context);
            },
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.04, vertical: 10),
        child: Form(
          key: _editProfileKey,
          child: Column(
            children: [
              EditProfileContainer(
                title: MetaText.basicInfo,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: EditProfileTextFormField(
                      hintText: MetaText.firstName,
                      onSaved: (String val) {
                        setState(() {
                          profile = profile.copyWith(firstName: val.trim());
                        });
                      },
                      validator: (String val) {
                        return null;
                      },
                    ),
                  ),
                  EditProfileTextFormField(
                    hintText: MetaText.lastName,
                    onSaved: (String val) {
                      setState(() {
                        profile = profile.copyWith(lastName: val.trim());
                      });
                    },
                    validator: (String val) {
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: EditProfileTextFormField(
                      hintText: MetaText.email,
                      onSaved: (String val) {
                        setState(() {
                          profile = profile.copyWith(email: val.trim());
                        });
                      },
                      validator: ValidationHelper.validateEmailAddress,
                    ),
                  ),
                  EditProfileTextFormField(
                    hintText: MetaText.mobilePhone,
                    onSaved: (String val) {
                      setState(() {
                        profile = profile.copyWith(mobile: val.trim());
                      });
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Please enter mobile number';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                child: EditProfileContainer(
                  title: MetaText.address,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: EditProfileTextFormField(
                        hintText: MetaText.street,
                        onSaved: (String val) {
                          setState(() {
                            profile = profile.copyWith(street: val.trim());
                          });
                        },
                        validator: (String val) {
                          return null;
                        },
                      ),
                    ),
                    EditProfileTextFormField(
                      hintText: MetaText.zipCode,
                      onSaved: (String val) {
                        setState(() {
                          profile = profile.copyWith(zipCode: val.trim());
                        });
                      },
                      validator: (String val) {
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: EditProfileTextFormField(
                        hintText: MetaText.country,
                        onSaved: (String val) {
                          setState(() {
                            profile = profile.copyWith(country: val.trim());
                          });
                        },
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a country';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    EditProfileTextFormField(
                      hintText: MetaText.state,
                      onSaved: (String val) {
                        setState(() {
                          profile = profile.copyWith(state: val.trim());
                        });
                      },
                      validator: (String val) {
                        if (val.isEmpty) {
                          return 'Please enter a state';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: EditProfileTextFormField(
                        hintText: MetaText.city,
                        onSaved: (String val) {
                          setState(() {
                            profile = profile.copyWith(city: val.trim());
                          });
                        },
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a city';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileContainer extends StatelessWidget {
  const EditProfileContainer({
    Key key,
    @required this.title,
    @required this.children,
  }) : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: MetaAsset.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: MetaAsset.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
