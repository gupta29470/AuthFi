import 'package:flutter/material.dart';

import '../screen/animated_home_screen.dart';
import '../screen/animated_login_screen.dart';
import '../utilities/page_routes/fade_page_route.dart';
import '../utilities/page_routes/slide_page_route.dart';

class ButtonWidget extends StatelessWidget {
  double deviceWidth, deviceHeight;
  BuildContext buildContext;
  String buttonText;
  Color buttonTextColor;
  Color borderColor;
  String mode;
  AnimationController animationController;

  ButtonWidget({
    this.deviceHeight,
    this.deviceWidth,
    this.buildContext,
    this.buttonText,
    this.buttonTextColor,
    this.borderColor,
    this.mode,
    this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: deviceWidth * 0.38,
      height: deviceHeight * 0.055,
      onPressed: () async {
        if (mode == "LOGIN") {
          await animationController.reverse();
        }
        Navigator.pushReplacement(
          context,
          mode == "LOGIN"
              ? FadePageRoute(
                  child: AnimatedHomeScreen(),
                )
              : SlidePageRoute(
                  child: AnimatedLoginScreen(),
                ),
        );
      },
      color: Colors.white,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18,
          color: buttonTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: borderColor,
        ),
      ),
    );
  }
}
