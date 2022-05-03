import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/models.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/modal.service.dart';
import 'package:passtore/src/widgets/widgets.dart';

class CustomModal extends StatefulWidget implements CustomOverlay {
  @override
  late final String id;
  @override
  final Widget? child;
  @override
  final CurvedAnimation? animationOut;
  @override
  final Function? onShow;
  @override
  final Function? onClose;
  @override
  final OverlayType type = OverlayType.modal;
  final String? title;
  final String? message;

  CustomModal({
    required this.id,
    this.child,
    this.title,
    this.message,
    this.animationOut,
    this.onShow,
    this.onClose,
  }) : super(key: ValueKey(id));

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal>
    with TickerProviderStateMixin {
  late final AnimationController _modalAnimationController =
      AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
    lowerBound: 0.4,
  );
  late final Animation<double> _modalAnimation = this.widget.animationOut ??
      CurvedAnimation(
        parent: this._modalAnimationController,
        curve: Curves.elasticOut,
      );
  late final OverlayCubit<CustomOverlay> _modalsCubit;
  final int _backgroundFadeDuration = 150;
  final double _blurMultiplier = AppMetrics.blurMultiplier;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    this._modalsCubit = DI.get<OverlayCubit>(instanceName: 'overlays');
    this._modalAnimationController.forward();
  }

  @override
  void dispose() {
    this._modalAnimationController.dispose();
    super.dispose();
  }

  void handleClose() {
    this.setState(() {
      this._opacity = 0.0;
    });
  }

  void handleRemove() {
    if (this._opacity == 0.0) {
      this._modalsCubit.removeOverlay(this.widget.id, this.widget.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OverlayCubit, OverlayCubitState>(
      listener: (context, modalsState) {
        bool isShouldBeClosed = modalsState.closingQueue.any((overlay) {
          return overlay.id == this.widget.id &&
              overlay.type == this.widget.type;
        });
        if (isShouldBeClosed) {
          this.handleClose();
        }
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: this._opacity),
        duration: Duration(milliseconds: this._backgroundFadeDuration),
        onEnd: this.handleRemove,
        builder: (BuildContext context, double opacity, _) {
          return Stack(
            children: [
              // Modal background
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: opacity * this._blurMultiplier,
                    sigmaY: opacity * this._blurMultiplier,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        opacity - 0.4 < 0.0 ? 0.0 : opacity - 0.4,
                      ),
                    ),
                  ),
                ),
              ),
              // Modal content
              Positioned.fill(
                child: Opacity(
                  opacity: opacity,
                  child: AnimatedBuilder(
                    animation: this._modalAnimation,
                    builder: (context, _) => FractionalTranslation(
                      translation: Offset(0.0, 1 - this._modalAnimation.value),
                      child: Padding(
                        padding: const EdgeInsets.all(AppMetrics.defaultMargin),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ThemedModalContent(
                              title: this.widget.title,
                              message: this.widget.message,
                              child: this.widget.child,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: AppMetrics.defaultMargin,
                              ),
                              child: ThemedButton(
                                text: 'Test button',
                                onTap: this.handleClose,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
