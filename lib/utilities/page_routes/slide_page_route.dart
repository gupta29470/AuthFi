import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute({this.child})
      : super(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext _context,
            Animation animation,
            Animation secondAnimation,
            Widget child,
          ) {
            animation =
                // -1 starts from left and 1 starts from right
                Tween<Offset>(
              begin: Offset(-1, 0),
              end: Offset(0, 0),
            ).animate(
              animation,
            );
            return SlideTransition(
              position: animation,
              child: child,
            );
          },
          pageBuilder: (
            BuildContext _context,
            animation,
            secondAnimation,
          ) {
            return child;
          },
        );
}
