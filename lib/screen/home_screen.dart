import 'package:flutter/material.dart';

import '../widget/button_widget.dart';
import '../utilities/animations/avatar_animations.dart';
import '../utilities/page_routes/slide_page_route.dart';

class HomeScreen extends StatelessWidget {
  double _deviceHeight, _deviceWidth;
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);

  AnimationController _animationController;
  AvatarAnimation _avatarAnimation;

  HomeScreen(this._animationController) {
    _avatarAnimation = AvatarAnimation(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _avatarWidget(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _nameWidget(),
              SizedBox(
                height: _deviceHeight * 0.20,
              ),
              _logoutButtonWidget(context),
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
          transform: Matrix4.diagonal3Values(
            _avatarAnimation.circleSize.value,
            _avatarAnimation.circleSize.value,
            1,
          ),
          child: Container(
            height: _circle,
            width: _circle,
            decoration: BoxDecoration(
              color: _primaryColor,
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

  Widget _nameWidget() {
    return Container(
      child: Text(
        "John Doe",
        style: TextStyle(
          color: _primaryColor,
          fontSize: 35,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _logoutButtonWidget(BuildContext buildContext) {
    return ButtonWidget(
      deviceHeight: _deviceHeight,
      deviceWidth: _deviceWidth,
      buttonTextColor: _primaryColor,
      buttonText: "LOGOUT",
      borderColor: _primaryColor,
      buildContext: buildContext,
      mode: "HOME",
    );
  }
}
