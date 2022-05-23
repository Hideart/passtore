import 'dart:async';

import 'package:flutter/material.dart';

class Tapable extends StatefulWidget {
  final Widget child;
  final Duration startAnimationDelay;
  final Curve? animation;
  final double minScale;
  final double maxScale;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? focusColor;
  final Color? hoverColor;
  final bool enableTapAnimation;
  final bool enableStartAnimation;
  final void Function(bool)? onHover;
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
    this.onHover,
    this.padding,
    this.decoration,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    this.startAnimationDelay = const Duration(seconds: 0),
    this.minScale = 0.9,
    this.maxScale = 1.0,
    this.enableTapAnimation = true,
    this.enableStartAnimation = false,
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
      if (!this.widget.enableTapAnimation) {
        return;
      }
      setState(() {
        this.scale = 1 - this._tapAnimationController.value;
      });
    });

  @override
  void initState() {
    super.initState();
    this._mounted = true;
    if (!this.widget.enableStartAnimation) {
      this._animationInController.value = 1;
      return;
    }
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
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: this.widget.decoration,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: this.widget.decoration?.borderRadius ??
                    BorderRadius.circular(0.0),
              ),
              hoverColor: this.widget.hoverColor ?? Colors.transparent,
              highlightColor: this.widget.highlightColor ?? Colors.transparent,
              splashColor:
                  this.widget.splashColor ?? Colors.grey.withOpacity(0.2),
              onTapDown: (details) {
                if (this.widget.enableTapAnimation) {
                  this._tapAnimationController.forward();
                }
                if (this.widget.onTapDown != null) {
                  this.widget.onTapDown!(details);
                }
              },
              onTapCancel: () {
                if (this.widget.enableTapAnimation) {
                  this._tapAnimationController.reverse();
                }
                if (this.widget.onTapCancel != null) {
                  this.widget.onTapCancel!();
                }
              },
              onTap: () {
                if (this.widget.enableTapAnimation) {
                  this._tapAnimationController.reverse();
                }
                this.widget.onTap();
              },
              child: Container(
                padding: this.widget.padding,
                child: this.widget.child,
              ),
              onHover: this.widget.onHover,
            ),
          ),
        ),
      ),
    );
  }
}
