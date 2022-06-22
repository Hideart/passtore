import 'package:flutter/material.dart';

Path squircleShape(Size localSize) {
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
