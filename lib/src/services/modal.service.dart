import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/core/models/models.dart';

class OverlayCubitState<T extends CustomOverlay> {
  final List<T> overlayQueue;
  final List<T> closingQueue;

  OverlayCubitState({
    this.overlayQueue = const [],
    this.closingQueue = const [],
  });
}

class OverlayCubit<T extends CustomOverlay>
    extends Cubit<OverlayCubitState<T>> {
  OverlayCubit([OverlayCubitState<T>? initialState])
      : super(initialState ?? OverlayCubitState<T>());

  void addOverlay(T newModal) {
    if (!this.isOverlayInQueue(newModal.id, newModal.type)) {
      return emit(
        OverlayCubitState(
          overlayQueue: [...this.state.overlayQueue, newModal],
          closingQueue: this.state.closingQueue,
        ),
      );
    }
  }

  void removeOverlay(String id, OverlayType type) {
    final List<T> overlayQueue = [...this.state.overlayQueue]..removeWhere(
        (CustomOverlay modal) => modal.id == id && modal.type == type,
      );
    final List<T> closingQueue = [...this.state.closingQueue]..removeWhere(
        (CustomOverlay modal) => modal.id == id && modal.type == type,
      );
    return emit(
      OverlayCubitState(overlayQueue: overlayQueue, closingQueue: closingQueue),
    );
  }

  void closeOverlay(String id, OverlayType type) {
    final List<T> overlayQueue = this.state.overlayQueue;
    if (overlayQueue.isNotEmpty &&
        overlayQueue.last.id == id &&
        overlayQueue.last.type == type) {
      final List<T> closingQueue = [
        ...this.state.closingQueue,
        this.state.overlayQueue.firstWhere((CustomOverlay modal) {
          return modal.id == id && modal.type == type;
        }),
      ];
      return emit(
        OverlayCubitState(
          overlayQueue: overlayQueue,
          closingQueue: closingQueue,
        ),
      );
    }
  }

  bool isOverlayInQueue(String id, OverlayType type) {
    return this.state.overlayQueue.any((overlay) {
      return overlay.id == id && overlay.type == type;
    });
  }
}
