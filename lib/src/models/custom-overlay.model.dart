import 'package:flutter/material.dart';

enum OverlayType { modal, snack, toast }

abstract class CustomOverlay extends Widget {
  final String id;
  final Widget child;
  final CurvedAnimation? animationOut;
  final Function? onShow;
  final Function? onClose;
  final bool close;
  final OverlayType type = OverlayType.modal;

  const CustomOverlay({
    required this.id,
    required this.child,
    required this.close,
    this.animationOut,
    this.onShow,
    this.onClose,
  });
}
