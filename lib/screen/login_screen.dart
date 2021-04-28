import 'package:flutter/material.dart';

import '../widget/text_field_widget.dart';
import '../widget/button_widget.dart';
import '../utilities/animations/avatar_animations.dart';

class LoginScreen extends StatelessWidget {
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);
  double _deviceHeight, _deviceWidth;
  AnimationController _animationController;

  AvatarAnimation _avatarAnimation;

  LoginScreen(this._animationController) {
    _avatarAnimation = AvatarAnimation(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatarWidget(),
              SizedBox(height: _deviceHeight * 0.05),
              _emailTextFieldWidget(),
              _passwordTextFieldWidget(),
              SizedBox(height: _deviceHeight * 0.10),
              _loginButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double _circle = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _avatarAnimation.animationController,
      builder: (BuildContext _context, Widget _widget) {
        return Transform(
          alignment: Alignment.center,
          // x, y, z values
          transform: Matrix4.diagonal3Values(
            _avatarAnimation.circleSize.value,
            _avatarAnimation.circleSize.value,
            1,
          ),
          child: Container(
            height: _circle,
            width: _circle,
            decoration: BoxDecoration(
              color: _secondaryColor,
              borderRadius: BorderRadius.circular(500),
              image: DecorationImage(
                image: AssetImage("assets/images/main_avatar.png"),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailTextFieldWidget() {
    return TextFieldWidget(
      deviceWidth: _deviceWidth * 0.70,
      obscureText: false,
      textInputAction: TextInputAction.next,
      hintText: "john.doe@gmail.com",
    );
  }

  Widget _passwordTextFieldWidget() {
    return TextFieldWidget(
      deviceWidth: _deviceWidth * 0.70,
      obscureText: true,
      textInputAction: TextInputAction.done,
      hintText: "Password",
    );
  }

  Widget _loginButtonWidget(BuildContext buildContext) {
    return ButtonWidget(
      deviceHeight: _deviceHeight,
      deviceWidth: _deviceWidth,
      buttonTextColor: _primaryColor,
      buttonText: "LOGIN",
      borderColor: Colors.white,
      buildContext: buildContext,
      mode: "LOGIN",
      animationController: _animationController,
    );
  }
}
