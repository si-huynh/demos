import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CustomTransitions {
  static Widget fadeThroughTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );

  static Route<T> modalBottomSheetRoute<T>(
    BuildContext context,
    Widget child,
    RouteSettings page,
  ) =>
      ModalBottomSheetRoute(
        builder: (context) => child,
        settings: page,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        useSafeArea: true,
      );
}
