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
    this._modalsState.remove(id);
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
              print('modalWidget is $modalWidget, $modalsQueue');
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  key: ValueKey(modalWidget?.id ?? 'null-key'),
                  child: modalWidget,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThemedModal extends StatelessWidget {
  final String id;
  final Function? onClose;
  final Widget child;

  const ThemedModal({
    required this.id,
    required this.child,
    this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Expanded(
        child: Container(
          color: const Color(0x88000000),
        ),
      ),
    );
  }
}
