import 'package:flutter/material.dart';

import 'home_screen.dart';

class AnimatedHomeScreen extends StatefulWidget {
  @override
  _AnimatedHomeScreenState createState() => _AnimatedHomeScreenState();
}

class _AnimatedHomeScreenState extends State<AnimatedHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return HomeScreen(_animationController);
  }
}
