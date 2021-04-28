import 'package:flutter/material.dart';

class AvatarAnimation {
  AnimationController animationController;
  Animation<double> circleSize;

  AvatarAnimation(this.animationController) {
    circleSize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }
}
