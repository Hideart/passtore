import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/src/widgets/modals.widget.dart';

class ModalsCubit extends Cubit<List<ThemedModal>> {
  ModalsCubit([List<ThemedModal>? initialState]) : super(initialState ?? []);

  final List<ThemedModal> _modalsQueue = [];

  void add(ThemedModal modal) {
    this._modalsQueue.add(modal);
    return emit(this._modalsQueue);
  }

  void remove(String id) {
    this._modalsQueue.removeWhere((modal) => modal.id == id);
    return emit(this._modalsQueue);
  }
}
