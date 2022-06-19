import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';

class SquaredIconButton extends StatefulWidget {
  final Color borderColor;
  final double? size;
  final TapableProps properties;

  const SquaredIconButton({
    Key? key,
    this.borderColor = Colors.transparent,
    this.size,
    required this.properties,
  }) : super(key: key);

  @override
  State<SquaredIconButton> createState() => _SquaredIconButtonState();
}

class _SquaredIconButtonState extends State<SquaredIconButton> {
  Size? tapableSize;

  void handleTapableSizeChange(Size tapableSize) {
    this.setState(() {
      this.tapableSize = tapableSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Tapable(
      properties: TapableProps(
        startAnimationDelay: this.widget.properties.startAnimationDelay,
        animation: this.widget.properties.animation,
        enableStartAnimation: this.widget.properties.enableStartAnimation,
        focusColor: this.widget.properties.focusColor,
        highlightColor: this.widget.properties.highlightColor,
        hoverColor: this.widget.properties.hoverColor,
        splashColor: this.widget.properties.splashColor,
        maxScale: this.widget.properties.maxScale,
        minScale: this.widget.properties.minScale,
        onHover: this.widget.properties.onHover,
        onTapCancel: this.widget.properties.onTapCancel,
        onTapDown: this.widget.properties.onTapDown,
        onTapUp: this.widget.properties.onTapUp,
        onTap: this.widget.properties.onTap,
        enableTapAnimation: this.widget.properties.enableTapAnimation,
        width: this.tapableSize?.width,
        height: this.tapableSize?.width,
        onSizeChange: this.handleTapableSizeChange,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     width: 1.0,
        //     color: this.widget.borderColor,
        //   ),
        // ),
        child: CustomPaint(
          painter: _BubbledSquarePainter(size: this.tapableSize),
          child: Container(
            padding: const EdgeInsets.all(AppMetrics.littleMargin / 2),
            width: this.widget.properties.width,
            height: this.widget.properties.width,
            child: this.widget.properties.child,
          ),
        ),
      ),
    );
  }
}

class _BubbledSquarePainter extends CustomPainter {
  final Size? size;

  _BubbledSquarePainter({this.size}) : super();

  @override
  void paint(Canvas canvas, Size canvasSize) {
    Size size = canvasSize;
    if (this.size != null) {
      size = Size(this.size!.width, this.size!.width);
    }

    final Paint paint = new Paint()..color = Colors.red;

    final path = Path()
      ..moveTo(
        size.width * 0.02,
        size.height / 4,
      )
      ..cubicTo(
        size.width * 0.04,
        size.height * 0.13,
        size.width * 0.13,
        size.height * 0.03,
        size.width / 4,
        size.height * 0.02,
      )
      ..cubicTo(
        size.width * 0.32,
        size.height * 0.01,
        size.width * 0.4,
        0,
        size.width / 2,
        0,
      )
      ..cubicTo(
        size.width * 0.6,
        0,
        size.width * 0.68,
        size.height * 0.01,
        size.width * 0.75,
        size.height * 0.02,
      )
      ..cubicTo(
        size.width * 0.87,
        size.height * 0.04,
        size.width * 0.97,
        size.height * 0.13,
        size.width * 0.98,
        size.height / 4,
      )
      ..cubicTo(
        size.width,
        size.height * 0.32,
        size.width,
        size.height * 0.4,
        size.width,
        size.height / 2,
      )
      ..cubicTo(
        size.width,
        size.height * 0.6,
        size.width,
        size.height * 0.68,
        size.width * 0.98,
        size.height * 0.75,
      )
      ..cubicTo(
        size.width * 0.96,
        size.height * 0.87,
        size.width * 0.87,
        size.height * 0.97,
        size.width * 0.75,
        size.height * 0.98,
      )
      ..cubicTo(
        size.width * 0.68,
        size.height,
        size.width * 0.6,
        size.height,
        size.width / 2,
        size.height,
      )
      ..cubicTo(
        size.width * 0.4,
        size.height,
        size.width * 0.32,
        size.height,
        size.width / 4,
        size.height * 0.98,
      )
      ..cubicTo(
        size.width * 0.13,
        size.height * 0.96,
        size.width * 0.03,
        size.height * 0.87,
        size.width * 0.02,
        size.height * 0.75,
      )
      ..cubicTo(
        size.width * 0.01,
        size.height * 0.68,
        0,
        size.height * 0.6,
        0,
        size.height / 2,
      )
      ..cubicTo(
        0,
        size.height * 0.4,
        size.width * 0.01,
        size.height * 0.32,
        size.width * 0.02,
        size.height / 4,
      )
      ..cubicTo(
        size.width * 0.02,
        size.height / 4,
        size.width * 0.02,
        size.height / 4,
        size.width * 0.02,
        size.height / 4,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
