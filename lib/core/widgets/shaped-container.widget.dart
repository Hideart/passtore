import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShapedContainer extends StatefulWidget {
  final EdgeInsets? padding;
  final Color color;
  final BorderSide? border;
  final double? size;
  final Widget child;
  final Path Function(Size) shapePath;

  const ShapedContainer({
    Key? key,
    this.color = Colors.transparent,
    this.border,
    this.padding,
    this.size,
    required this.shapePath,
    required this.child,
  }) : super(key: key);

  @override
  State<ShapedContainer> createState() => _ShapedContainerState();
}

class _ShapedContainerState extends State<ShapedContainer> {
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
      clipper: _SquircleClipper(
        size: this.contentSize,
        shapePath: this.widget.shapePath,
      ),
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
                    shapePath: this.widget.shapePath,
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
  final Path Function(Size) shapePath;

  _SquirclePainter({
    required this.border,
    required this.shapePath,
    this.size,
  }) : super();

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

    canvas.drawPath(this.shapePath(localSize), borderFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _SquircleClipper extends CustomClipper<Path> {
  final Size? size;
  final Path Function(Size) shapePath;

  const _SquircleClipper({
    this.size,
    required this.shapePath,
  }) : super();

  @override
  Path getClip(Size size) {
    Size localSize = size;
    if (this.size != null) {
      localSize = Size(this.size!.width, this.size!.width);
    }
    return this.shapePath(localSize);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
