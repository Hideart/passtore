import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/core/models/models.dart';
import 'package:passtore/src/services/modal.service.dart';

class ModalsContainer extends StatelessWidget {
  const ModalsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
