import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/src/models/models.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/modal.service.dart';

class ThemedModal extends StatefulWidget implements CustomOverlay {
  @override
  final String id;
  @override
  final Widget child;
  @override
  final CurvedAnimation? animationOut;
  @override
  final Function? onShow;
  @override
  final Function? onClose;
  @override
  final bool close;
  @override
  final OverlayType type = OverlayType.modal;

  const ThemedModal({
    required this.id,
    required this.child,
    required this.close,
    this.animationOut,
    this.onShow,
    this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  State<ThemedModal> createState() => _ThemedModalState();
}

class _ThemedModalState extends State<ThemedModal>
    with TickerProviderStateMixin {
  late final AnimationController _modalAnimationController =
      AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _modalAnimation = this.widget.animationOut ??
      CurvedAnimation(
        parent: this._modalAnimationController,
        curve: Curves.elasticOut,
      );
  late final OverlayCubit<CustomOverlay> _modalsCubit;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    this._modalsCubit = DI.get<OverlayCubit>(instanceName: 'overlays');
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
        duration: const Duration(milliseconds: 300),
        onEnd: this.handleRemove,
        builder: (BuildContext context, double opacity, _) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    color: const Color(0x88000000),
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
