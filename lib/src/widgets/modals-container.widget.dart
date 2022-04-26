import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/core/models/models.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/modal.service.dart';

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
              List<CustomOverlay> modalsQueue = overlaysState.overlayQueue
                  .where(
                    (overlay) => overlay.type == OverlayType.modal,
                  )
                  .toList();
              return modalsQueue.isNotEmpty
                  ? modalsQueue.first
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
