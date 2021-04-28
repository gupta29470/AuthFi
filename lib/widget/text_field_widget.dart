import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  double deviceWidth;
  bool obscureText;
  String hintText;
  TextInputAction textInputAction;

  TextFieldWidget({
    this.deviceWidth,
    this.hintText,
    this.obscureText,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      child: TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        obscureText: obscureText,
        textInputAction: textInputAction,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
