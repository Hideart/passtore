import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/src/services/modal.service.dart';

class ModalsContainer extends StatelessWidget {
  const ModalsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModalsCubit, List<ThemedModal>>(
      builder: (context, modalsQueue) {
        ThemedModal? modalWidget;
        if (modalsQueue.isNotEmpty) {
          modalWidget = modalsQueue[modalsQueue.length - 1];
        }

        return Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: modalWidget,
            ),
          ],
        );
      },
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
