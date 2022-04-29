import 'dart:async';

import 'package:flutter/material.dart';

class Tapable extends StatefulWidget {
  final Widget child;
  final Duration startAnimationDelay;
  final Curve? animation;
  final double minScale;
  final double maxScale;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;
  final void Function() onTap;

  const Tapable({
    Key? key,
    this.animation,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.startAnimationDelay = const Duration(seconds: 0),
    this.minScale = 0.9,
    this.maxScale = 1.0,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Tapable> createState() => _TapableState();
}

class _TapableState extends State<Tapable> with TickerProviderStateMixin {
  double scale = 1;

  bool _mounted = false;

  late final AnimationController _animationInController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animationIn = CurvedAnimation(
    parent: this._animationInController,
    curve: this.widget.animation ?? Curves.fastLinearToSlowEaseIn,
  );
  late final AnimationController _tapAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 100,
    ),
    lowerBound: 1 - this.widget.maxScale,
    upperBound: 1 - this.widget.minScale,
  )..addListener(() {
      setState(() {
        this.scale = 1 - this._tapAnimationController.value;
      });
    });

  @override
  void initState() {
    super.initState();
    this._mounted = true;
    switch (this._animationInController.status) {
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        Timer(
          this.widget.startAnimationDelay,
          () {
            if (this._mounted) {
              this._animationInController.forward();
            }
          },
        );
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    this._animationInController.dispose();
    this._tapAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: this._animationIn,
      child: Transform.scale(
        scale: this.scale,
        child: GestureDetector(
          onTapDown: (details) {
            this._tapAnimationController.forward();
            if (this.widget.onTapDown != null) {
              this.widget.onTapDown!(details);
            }
          },
          onTapUp: (details) {
            this._tapAnimationController.reverse();
            if (this.widget.onTapUp != null) {
              this.widget.onTapUp!(details);
            }
          },
          onTapCancel: () {
            this._tapAnimationController.reverse();
            if (this.widget.onTapCancel != null) {
              this.widget.onTapCancel!();
            }
          },
          onTap: this.widget.onTap,
          child: this.widget.child,
        ),
      ),
    );
  }
}
