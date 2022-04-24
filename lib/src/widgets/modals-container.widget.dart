import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/src/models/models.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/modal.service.dart';
import 'package:passtore/src/widgets/themed-modal.widget.dart';

class ModalsContainer extends StatelessWidget {
  late final OverlayCubit _modalsState;

  ModalsContainer({Key? key}) : super(key: key) {
    this._modalsState = DI.get<OverlayCubit>(instanceName: 'overlays');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OverlayCubit>(
      create: (_) => this._modalsState,
      child: Stack(
        children: [
          BlocBuilder<OverlayCubit, OverlayCubitState>(
            builder: (context, overlaysState) {
              ThemedModal? modalWidget;
              List<CustomOverlay> modalsQueue = overlaysState.overlayQueue
                  .where(
                    (overlay) => overlay.type == OverlayType.modal,
                  )
                  .toList();
              if (modalsQueue.isNotEmpty) {
                modalWidget =
                    modalsQueue[modalsQueue.length - 1] as ThemedModal;
              }
              print('modalWidget $modalWidget');
              return modalWidget ?? const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
