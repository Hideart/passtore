import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/src/widgets/modals.widget.dart';

class ModalsCubit extends Cubit<List<ThemedModal>> {
  ModalsCubit([List<ThemedModal>? initialState]) : super(initialState ?? []);

  void add(ThemedModal modal) {
    return emit([...this.state, modal]);
  }

  void remove(String id) {
    return emit(this.state.where((modal) => modal.id != id).toList());
  }

  bool isModalInQueue(String id) {
    return this.state.any((modal) => modal.id == id);
  }
}
