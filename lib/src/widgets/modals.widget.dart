import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/modal.service.dart';

class ModalsContainer extends StatelessWidget {
  late final ModalsCubit _modalsState;

  ModalsContainer({Key? key}) : super(key: key) {
    DI.registerLazySingleton<ModalsCubit>(
      () => ModalsCubit(),
      instanceName: 'modals',
    );
    _modalsState = DI.get<ModalsCubit>(instanceName: 'modals');
  }

  void show(ThemedModal modal) {
    this._modalsState.add(modal);
  }

  void close(String id) {
    ThemedModal? targetModal =
        this._modalsState.state.firstWhere((modal) => modal.id == id);
    targetModal.handleClose(() => this._modalsState.remove(id));
  }

  bool isModalInQueue(String id) {
    return this._modalsState.isModalInQueue(id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ModalsCubit>(
      create: (_) => this._modalsState,
      child: Stack(
        children: [
          BlocBuilder<ModalsCubit, List<ThemedModal>>(
            builder: (context, modalsQueue) {
              ThemedModal? modalWidget;
              if (modalsQueue.isNotEmpty) {
                modalWidget = modalsQueue[modalsQueue.length - 1];
              }
              final Widget modal = Container(
                key: ValueKey(modalWidget?.id ?? 'null-key'),
                child: modalWidget,
              );
              if (modalWidget?.shadowedBackground ?? false) {
                return AnimatedSwitcher(
                  duration: modalWidget!.fadeDuration,
                  child: modal,
                );
              }
              return modal;
            },
          ),
        ],
      ),
    );
  }
}

class ThemedModal extends StatefulWidget {
  final String id;
  final Widget child;
  final Curve? modalAnimation;
  final Function? onClose;
  final Duration fadeDuration;
  final bool shadowedBackground;
  final _ThemedModalState _state = _ThemedModalState();

  ThemedModal({
    required this.id,
    required this.child,
    this.onClose,
    this.modalAnimation,
    this.fadeDuration = const Duration(milliseconds: 1000),
    this.shadowedBackground = true,
    Key? key,
  }) : super(key: key);

  void handleClose(Function? callback) {
    this._state.handleClose(callback);
  }

  @override
  // ignore: no_logic_in_create_state
  State<ThemedModal> createState() => this._state;
}

class _ThemedModalState extends State<ThemedModal>
    with TickerProviderStateMixin {
  bool _firstMounted = false;
  bool _visible = true;
  Timer _closeTimer = Timer(Duration.zero, () {});

  late final AnimationController _modalAnimationController =
      AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _modalAnimation = CurvedAnimation(
    parent: this._modalAnimationController,
    curve: this.widget.modalAnimation ?? Curves.elasticOut,
  );

  void handleClose(Function? callback) {
    if (!this._closeTimer.isActive) {
      this.setState(() {
        this._visible = false;
      });
      this._closeTimer = Timer(this.widget.fadeDuration, () {
        if (this.widget.onClose != null) {
          this.widget.onClose!();
        }
        this._closeTimer.cancel();
        if (callback != null) {
          callback();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('test, $_firstMounted, $_visible');
    if (!this._firstMounted) {
      this.setState(() {
        this._firstMounted = true;
      });
    }
    print('test1, $_firstMounted, $_visible');
    return AnimatedOpacity(
      opacity: this._visible && !this._firstMounted ? 1.0 : 0.0,
      duration: this.widget.fadeDuration,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: const Color(0x88000000),
            ),
          ),
        ],
      ),
    );
  }
}
