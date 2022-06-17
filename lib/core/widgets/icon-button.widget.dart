import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';

class SquaredIconButton extends StatelessWidget {
  final Color borderColor;
  final TapableProps properties;

  const SquaredIconButton({
    Key? key,
    this.borderColor = Colors.transparent,
    required this.properties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapable(
      properties: TapableProps(
        startAnimationDelay: this.properties.startAnimationDelay,
        animation: this.properties.animation,
        enableStartAnimation: this.properties.enableStartAnimation,
        focusColor: this.properties.focusColor,
        highlightColor: this.properties.highlightColor,
        hoverColor: this.properties.hoverColor,
        splashColor: this.properties.splashColor,
        maxScale: this.properties.maxScale,
        minScale: this.properties.minScale,
        onHover: this.properties.onHover,
        onTapCancel: this.properties.onTapCancel,
        onTapDown: this.properties.onTapDown,
        onTapUp: this.properties.onTapUp,
        onTap: this.properties.onTap,
        child: this.properties.child,
        enableTapAnimation: this.properties.enableTapAnimation,
        padding: const EdgeInsets.all(AppMetrics.littleMargin / 2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(9, 11)),
          border: Border.all(
            width: 1.0,
            color: this.borderColor,
          ),
        ),
      ),
    );
  }
}
