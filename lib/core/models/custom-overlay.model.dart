import 'package:flutter/material.dart';

enum OverlayType { modal, snack, toast }

abstract class CustomOverlay extends Widget {
  final String id;
  final Widget? child;
  final CurvedAnimation? animationOut;
  final Function? onShow;
  final Function? onClose;
  final OverlayType type = OverlayType.modal;

  const CustomOverlay({
    required this.id,
    this.child,
    this.animationOut,
    this.onShow,
    this.onClose,
  });
}
