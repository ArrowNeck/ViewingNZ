import 'package:flutter/material.dart';

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect) with size transition animation.
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required WidgetBuilder builder,
    this.barrierClr,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    super.fullscreenDialog,
  }) : _builder = builder;

  final WidgetBuilder _builder;
  final Color? barrierClr;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => animationDuration;

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => barrierClr ?? Colors.black.withAlpha(150);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Create a curved animation
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: animationCurve,
    );

    // Scale transition with fade effect
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
