import 'dart:math';

import 'package:flutter/material.dart';

class _TransitionBody extends StatelessWidget {
  final ThemeData themeData;
  final Widget child;

  const _TransitionBody({
    Key? key,
    required this.themeData,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: this.themeData,
      child: this.child,
    );
  }
}

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
  final ThemeData theme;

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
    this.lastTheme = this.widget.theme;
    this.isDarkNow = this.widget.theme.brightness == Brightness.dark;
    if (widget.themeController == null) {
      _animationController =
          AnimationController(vsync: this, duration: widget.duration);
    } else {
      _animationController = widget.themeController!;
    }
    _animationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
        case AnimationStatus.dismissed:
          this.setState(() {
            this.animationStopped = true;
          });
          break;
        default:
          if (this.animationStopped) {
            this.setState(() {
              this.animationStopped = false;
            });
          }
          break;
      }
    });
  }

  double _radius(Size size) {
    final maxVal = max(size.width, size.height);
    return maxVal * 1.5;
  }

  late AnimationController _animationController;
  late double radius;
  double x = 0;
  double y = 0;
  Offset position = Offset.zero;
  bool animationStopped = true;
  late ThemeData lastTheme;
  late bool isDarkNow;

  @override
  void didUpdateWidget(ThemeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.setState(() {
      this.lastTheme = oldWidget.theme;
      this.isDarkNow = oldWidget.theme.brightness == Brightness.dark;
    });
    if (widget.theme.brightness == oldWidget.theme.brightness) {
      _animationController.reset();
      _animationController.forward();
    } else {
      if (widget.theme.brightness == Brightness.light) {
        _animationController.fling();
        _animationController.reverse();
      } else {
        _animationController.reset();
        _animationController.forward();
      }
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

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return PageStorage(
          bucket: this._bucket,
          child: Stack(
            key: const PageStorageKey('__THEME_ANIMATED_CHILDREN__'),
            children: !this.animationStopped
                ? [
                    GestureDetector(),
                    _TransitionBody(
                      child: this.widget.child,
                      themeData:
                          this.isDarkNow ? this.widget.theme : this.lastTheme,
                    ),
                    ClipPath(
                      clipper: CircularClipper(
                        _animationController.value * radius,
                        position,
                      ),
                      child: _TransitionBody(
                        child: this.widget.child,
                        themeData:
                            this.isDarkNow ? this.lastTheme : this.widget.theme,
                      ),
                    ),
                  ]
                : [
                    _TransitionBody(
                      child: this.widget.child,
                      themeData: this.widget.theme,
                    ),
                  ],
          ),
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
