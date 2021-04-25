import 'package:flutter/material.dart';

class EditProfileTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) validator;
  final Function(String) onSaved;
  final TextEditingController controller;

  const EditProfileTextFormField({
    Key key,
    @required this.hintText,
    this.validator,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.black,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
      ),
      onSaved: onSaved,
      validator: validator,
      cursorColor: Colors.white,
    );
  }
}
