import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SquircledContainer extends StatefulWidget {
  final EdgeInsets? padding;
  final Color color;
  final BorderSide? border;
  final double? size;
  final Widget child;

  const SquircledContainer({
    Key? key,
    this.color = Colors.transparent,
    this.border,
    this.padding,
    this.size,
    required this.child,
  }) : super(key: key);

  @override
  State<SquircledContainer> createState() => _SquircledContainerState();
}

class _SquircledContainerState extends State<SquircledContainer> {
  Size? contentSize;
  final GlobalKey contentKey = GlobalKey();

  void handleContentSizeChange(Size contentSize) {
    this.setState(() {
      this.contentSize = contentSize;
    });
  }

  void postFrameCallback(Duration duration) {
    try {
      final BuildContext? context = this.contentKey.currentContext;
      final Size? contentSize = context!.size;
      if (contentSize != null && contentSize != this.contentSize) {
        this.setState(() {
          this.contentSize = contentSize;
        });
      }
    } catch (_) {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(this.postFrameCallback);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _SquircleClipper(size: this.contentSize),
      child: Stack(
        children: [
          Container(
            key: contentKey,
            padding: this.widget.padding,
            color: this.widget.color,
            child: this.widget.child,
          ),
          this.widget.border != null
              ? CustomPaint(
                  painter: _SquirclePainter(
                    size: this.contentSize,
                    border: this.widget.border!,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _SquirclePainter extends CustomPainter {
  final BorderSide border;
  final Size? size;

  _SquirclePainter({required this.border, this.size}) : super();

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final Paint borderFill = new Paint();
    borderFill
      ..color = this.border.color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.border.width;

    Size localSize = canvasSize;
    if (this.size != null) {
      localSize = Size(this.size!.width, this.size!.width);
    }

    canvas.drawPath(_squiecleShape(localSize), borderFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _SquircleClipper extends CustomClipper<Path> {
  final Size? size;

  const _SquircleClipper({this.size}) : super();

  @override
  Path getClip(Size size) {
    Size localSize = size;
    if (this.size != null) {
      localSize = Size(this.size!.width, this.size!.width);
    }
    return _squiecleShape(localSize);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Path _squiecleShape(Size localSize) {
  return Path()
    ..moveTo(0, localSize.height / 2)
    ..cubicTo(
      0,
      localSize.height * 0.08,
      localSize.width * 0.08,
      0,
      localSize.width / 2,
      0,
    )
    ..cubicTo(
      localSize.width * 0.93,
      0,
      localSize.width,
      localSize.height * 0.08,
      localSize.width,
      localSize.height / 2,
    )
    ..cubicTo(
      localSize.width,
      localSize.height * 0.93,
      localSize.width * 0.93,
      localSize.height,
      localSize.width / 2,
      localSize.height,
    )
    ..cubicTo(
      localSize.width * 0.08,
      localSize.height,
      0,
      localSize.height * 0.93,
      0,
      localSize.height / 2,
    )
    ..close();
}
