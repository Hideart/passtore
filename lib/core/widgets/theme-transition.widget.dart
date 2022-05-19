import 'dart:math';

import 'package:flutter/material.dart';
import 'package:passtore/assets/themes/themes.dart';
import 'package:passtore/core/models/theme.model.dart';

class ThemeTransition extends StatefulWidget {
  const ThemeTransition({
    required this.child,
    required this.theme,
    Key? key,
    this.offset = Offset.zero,
    this.themeController,
    this.radius,
    this.duration = const Duration(milliseconds: 400),
  }) : super(key: key);

  /// Deinfe the widget that will be transitioned
  /// int index is either 1 or 2 to identify widgets, 2 is the top widget
  final Widget child;

  /// The next theme data
  final AppTheme theme;

  /// optional animation controller to controll the animation
  final AnimationController? themeController;

  /// centeral point of the circular transition
  final Offset offset;

  /// optional radius of the circle defaults to [max(height,width)*1.5])
  final double? radius;

  /// duration of animation defaults to 400ms
  final Duration? duration;
  @override
  _ThemeTransitionState createState() => _ThemeTransitionState();
}

class _ThemeTransitionState extends State<ThemeTransition>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.themeController == null) {
      _animationController =
          AnimationController(vsync: this, duration: widget.duration);
    } else {
      _animationController = widget.themeController!;
    }
  }

  double _radius(Size size) {
    final maxVal = max(size.width, size.height);
    return maxVal * 1.5;
  }

  late AnimationController _animationController;
  double x = 0;
  double y = 0;
  bool isDark = false;
  // bool isBottomThemeDark = true;
  bool isDarkVisible = false;
  late double radius;
  Offset position = Offset.zero;

  @override
  void didUpdateWidget(ThemeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.theme.brightness == Brightness.light) {
      _animationController.reverse();
    } else {
      _animationController.reset();
      _animationController.forward();
    }
    position = widget.offset;
    if (widget.radius != oldWidget.radius) {
      _updateRadius();
    }
    if (widget.duration != oldWidget.duration) {
      _animationController.duration = widget.duration;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateRadius();
  }

  void _updateRadius() {
    final size = MediaQuery.of(context).size;
    if (widget.radius == null) {
      radius = _radius(size);
      return;
    }
    radius = widget.radius!;
  }

  @override
  Widget build(BuildContext context) {
    Widget _body(int index) {
      return Theme(
        data: index == 2 ? darkThemeData : lightThemeData,
        child: this.widget.child,
      );
    }

    final bool prepareAnimation =
        this._animationController.status != AnimationStatus.forward ||
            this._animationController.status != AnimationStatus.reverse;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            prepareAnimation ? _body(1) : this.widget.child,
            ClipPath(
              clipper: CircularClipper(
                _animationController.value * radius,
                position,
              ),
              child: prepareAnimation ? _body(2) : null,
            ),
          ],
        );
      },
    );
  }
}

class CircularClipper extends CustomClipper<Path> {
  const CircularClipper(this.radius, this.center);
  final double radius;
  final Offset center;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.addOval(Rect.fromCircle(radius: radius, center: center));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
