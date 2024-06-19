import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'global_loader_event.dart';

part 'global_loader_state.dart';

class GlobalLoaderBloc extends Bloc<GlobalLoaderEvent, GlobalLoaderState> {
  GlobalLoaderBloc() : super(const GlobalLoaderState(isLoading: false)) {
    on<GlobalLoaderEvent>((event, emit) {
      if (event is ShowLoader) {
        emit(state.copyWith(isLoading: true));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
